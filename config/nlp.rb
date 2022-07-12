Kogno::Application.configure do |config|

  config.nlp.wit = {
    enable: true,
    api_version: "20220622",
    apps: {
      default: "<WIT SERVER TOKEN FOR ENGLISH APP>",
      es: "<WIT SERVER TOKEN FOR SPANISH APP>"
    }
  }

end