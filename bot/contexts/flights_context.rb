class FlightsContext < Conversation

  def blocks

    postback "search_start" do |params|
      reset_search()    
      if !params[:destination].nil?
        ask "destination_city", destination_city: params[:destination]
      else
        @reply.template "search_intro"        
      end
    end

    intent "search" do |text,entities|

      reset_search()
      search_params = {}   
      search_params[:destination_city] = get_location_from_entity(entities[:"wit$location:location"]) unless entities[:"wit$location:location"].nil?
      if  !entities[:datetime_range].nil?
        search_params[:departure_date] = entities[:datetime_range][:from]
        search_params[:return_date] = entities[:datetime_range][:to]
      elsif !entities[:datetime].nil?
        search_params[:departure_date] = entities[:datetime].first
      end
      unless search_params.empty?
        ask "destination_city", search_params
      else
        @reply.template "search_intro"
      end

    end

    deep.keyword ["stop","cancel","quit"]  do
      @reply.text "#{t(:got_it)}.."
      @reply.template "main/menu", title: t(:is_there_something_else_i_can_do_for_you?)
      exit_answer()
    end

    answer "departure_city" do |search_params|

      ask do
        if @user.city.nil?
          @reply.text t(:from_where_city?)
        else
          @reply.template "confirm_default_city_as_departure"
        end
      end

      entity "wit$location:location" do |values|
        city = get_location_from_entity(values)
        unless city.nil?
          @reply.template "search/city", query: city
        else
          continue
        end
      end

      any_text do |city|
        @reply.template "search/city" , { query: city }
      end

      postback "use_default_city" do 
        @user.vars[:flight_search][:departure_city] = @user.city.code
        next_ask(search_params)
      end

      postback "change" do
        @reply.text t(:alright)
        @reply.typing 1
        @reply.text t(:from_where_city?)
      end

      postback "confirm" do |params|
        city_id = params[:city_id]
        city = City.find(city_id)
        @user.vars[:flight_search][:departure_city] = city.code
        next_ask(search_params)
      end

      postback "restart" do
        @reply.text t(:alright)
        @reply.typing 1
        @reply.text t(:example_of_cities)
        @reply.text t(:from_where_city?)
      end

    end

    answer "destination_city" do |search_params|

      query = search_params[:destination_city]

      ask do
        if query.nil?     
          @reply.text t(:where_are_you_flying?)
        else
          @reply.template "search/city", query: query
        end
      end

      entity "wit$location:location" do |values|
        city = get_location_from_entity(values)
        unless city.nil?
          @reply.template "search/city", query: city
        else
          continue
        end
      end

      any_text do |city|
        @reply.template "search/city", query: city
      end

      postback "confirm" do |params|
        city_id = params[:city_id]
        city = City.find(city_id)
        @user.vars[:flight_search][:destination_city] = city.code
        next_ask(search_params)
      end      

      postback "restart" do
        @reply.text t(:alright)
        @reply.typing 1
        @reply.text t(:example_of_cities)    
        @reply.text t(:where_are_you_flying?)    
      end

    end


    answer "departure_date" do |search_params|

      departure_date = search_params[:departure_date]
      return_date = search_params[:return_date]

      ask do        
        if !departure_date.nil? and !return_date.nil?
          @reply.template "confirm_date_range", departure_date: departure_date, return_date: return_date
        elsif !departure_date.nil?
          @reply.template "search/confirm_date", date: departure_date
        else
          @reply.text t(:when_do_you_want_to_fly?)
          @reply.text t(:if_it_is_a_round_trip_write_both_dates)
        end
      end

      datetime_range do |from,to|
        @reply.template "confirm_date_range", departure_date: from, return_date: to
        #  @user.vars[:flight_search][:departure_date] = from
        #  @user.vars[:flight_search][:return_date] = to
      end

      datetime do |dates|
        @reply.template "search/confirm_date", date: dates
      end

      postback "confirm" do |params|

        if !params[:date].nil?
          @user.vars[:flight_search][:departure_date] = params[:date]
        else 
          @user.vars[:flight_search][:departure_date] = params[:departure_date]
          @user.vars[:flight_search][:return_date] = params[:return_date]
        end

        next_ask(search_params)

      end

      postback "restart" do
        @reply.text t(:alright)
        @reply.typing 1
        @reply.text t(:when_do_you_want_to_fly?)
        @reply.text t(:if_it_is_a_round_trip_write_both_dates)
      end

      everything_else do 
        @reply.text t(:departure_date_needed) + " (#{t(:opt_out_message_in_search_short)})"
      end

    end

    answer "return_date" do |search_params|

      ask do
        @reply.text t(:when_do_you_want_to_return?)
        @reply.quick_reply(
          t(:one_way_only_press_the_button),
          {
            title: t(:one_way),
            payload: "one_way"
          }
        )

        set_nlp_reference(reference_time: @user.vars[:flight_search][:departure_date]) unless @user.vars[:flight_search][:departure_date].nil?
      end

      datetime_range do |from,to|
        @reply.template "search/confirm_date_range", departure_date: from, return_date: to
      end

      datetime do |dates|
        @reply.template "search/confirm_date", date: dates
      end

      duration do |values|
        duration_in_seconds = values.first[:normalized][:value]
        return_date = @user.vars[:flight_search][:departure_date].to_time + duration_in_seconds
        @reply.template "search/confirm_date", date: return_date
      end


      postback "confirm" do |params|
        if !params[:date].nil?
          @user.vars[:flight_search][:return_date] = params[:date]
        else 
          @user.vars[:flight_search][:departure_date] = params[:departure_date]
          @user.vars[:flight_search][:return_date] = params[:return_date]
        end

        next_ask(search_params)
      end

      postback "restart" do
        @reply.text t(:alright)
        @reply.typing 1
        @reply.text t(:when_do_you_want_to_fly?)
        @reply.text t(:if_it_is_a_round_trip_write_both_dates)
      end

      postback "one_way" do 
        @user.vars[:flight_search][:return_date] = false
        next_ask(search_params)
      end

      everything_else do 
        @reply.text t(:return_date_needed) + " (#{t(:opt_out_message_in_search_short)})"
      end

      on_exit do 
        destroy_nlp_reference()
      end

    end

    postback "confirm_search" do |params|
      @user.vars[:flight_search] = nil
      @reply.template "search_results", params
    end

    postback "reject_search" do 
      reset_search()
      @reply.text t(:ok_lets_start_again)      
      ask "destination_city"
    end

  end

  protected

  # def search_start_with_params(**args)
  #   reset_search()
  #   if !args[:destination_city].nil?
  #     ask "destination_city", query: args[:destination]
  #   else
  #     @reply.template "search_intro"
  #     ask "destination_city"
  #   end
  # end

  def next_ask(search_params={})

    @user.vars[:flight_search].each do |field,value|
      if value.nil?

        @reply.text "#{t(:alright)}.."
        @reply.typing 2
        ask(field, search_params)
        return true

      end
    end 

    exit_answer()
    @reply.template "search_result_confirmation", @user.vars[:flight_search]

  end

  def search_result_url(search)
    if search[:return_date]
      "https://www.kayak.com/flights/#{search[:departure_city]}-#{search[:destination_city]}/#{l(search[:departure_date].to_date, format: "%Y-%m-%d")}/#{l(search[:return_date].to_date, format: "%Y-%m-%d")}?sort=bestflight_a"
    else
      "https://www.kayak.com/flights/#{search[:departure_city]}-#{search[:destination_city]}/#{l(search[:departure_date].to_date, format: "%Y-%m-%d")}?sort=bestflight_a"
    end
  end

  def reset_search
    @user.vars[:flight_search] = {
      departure_city: nil,
      destination_city: nil,
      departure_date: nil,
      return_date: nil      
    }
  end

end