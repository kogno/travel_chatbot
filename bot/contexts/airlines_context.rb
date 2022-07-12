class AirlinesContext < Conversation

  def blocks

    postback "search_checking_link" do
      @reply.text t(:alright)
      @reply.template "start_search"
    end

    postback "retry_search_checking_link" do
      @reply.text t(:ok_lets_start_again)
      @reply.template "start_search"
    end

    intent "checking" do
      @reply.text t(:alright)
      @reply.template "start_search"
    end

    postback "get_checking_link" do |params|
      airline = Airline.find(params[:airline_id])
      link = airline.checking_link
      unless link.nil?
        @reply.template "checking_link", airline: airline, link: link
      else
        @reply.text t(:checking_link_not_found, airline_name: airline.name)
      end
    end

    answer "airline_name" do 

      any_text do |text|
        @reply.template "search", query: text
      end

      keyword ["stop","cancel","quit"]  do
        @reply.text "#{t(:got_it)}.."
        @reply.template "main/menu", title: t(:is_there_something_else_i_can_do_for_you?)
        exit_answer()
      end  

    end

  end

end