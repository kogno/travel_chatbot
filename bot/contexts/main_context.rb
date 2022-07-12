class MainContext < Conversation

  def blocks

    before_anything do
      if @user.first_time?
        @reply.template "intro"
        halt()
      end
    end

    postback "get_started" do
      @reply.template "intro"
    end

    command "start" do 
      @reply.template "intro"
    end

    postback "intro_bot" do
      @reply.text t(:intro_bot_m1)
      @reply.typing 2
      @reply.text t(:intro_bot_m2)
      @reply.template "main/menu", {title: t(:intro_bot_m3)}
    end

    intent "greeting" do
      @reply.text t(:hello)
      @reply.template "menu", title: t(:how_can_i_help_you?)
    end

    intent "thanks" do 
      @reply.text t(:you_are_welcome)
      @reply.template "menu", title: t(:is_there_something_else_i_can_do_for_you?)
    end

    entity "wit$location:location" do |values|
      location = get_location_from_entity(values)
      @reply.quick_reply(
        t(:are_you_looking_for_a_flight_to?, location: location),
        {
          title: t(:afirmation),
          payload: set_payload("flights/search_start", destination: location)
        }
      )
    end

    everything_else do
      @reply.text t(:do_not_understand)
      @reply.template "menu", title: t(:maybe_i_can_help_you_with_these)
    end

  end

end
