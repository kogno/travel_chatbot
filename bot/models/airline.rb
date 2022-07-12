class Airline < ActiveRecord::Base

  def logo(size=200)
    "http://pics.avs.io/#{size}/#{size}/#{self.code}.png"
  end

end
