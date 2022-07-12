class SettingsContext < Conversation

  def blocks

    postback "menu" do 
      @reply.template "menu"
    end

    postback "set_default_city" do
      @reply.template "set_default_city"
    end

    postback "change_language" do |params|
      lang = params[:lang]
      change_locale(lang)
      @reply.text t(:language_changed_to, language: language_info(lang)[:name])      
    end

    intent "change_city" do
      @reply.template "set_default_city"
    end

    postback "set_default_city_confirm" do 
      ask("default_city")
    end

    answer "default_city" do 

      ask do
        @reply.text t(:default_city_request) + " (" + t(:opt_out_message_in_search) + ")"
      end

      entity "wit$location:location" do |values|
        city = values[0][:resolved][:values][0][:name] rescue nil
        city = values[0][:value] if city.nil?
        unless city.nil?
          @reply.template "search/city", query: city
        else
          continue
        end
      end

      any_text do |city|
        @reply.template "search/city" , { query: city }
      end

      postback "confirm" do |params|
        city = City.find(params[:city_id])
        @user.city = city
        @reply.text t(:default_city_changed_confirmation, city_name: city.name_with_country_emoji)
        exit_answer()
      end

      postback "restart" do
        @reply.text t(:alright)
        @reply.typing 1
        @reply.text t(:example_of_cities)
        @reply.text t(:default_city_request)
      end

      keyword ["stop","cancel","quit"]  do
        @reply.text "#{t(:got_it)}.."
        @reply.template "main/menu", title: t(:is_there_something_else_i_can_do_for_you?)
        exit_answer()
      end      

    end

  end

end