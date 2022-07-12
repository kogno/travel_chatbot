class City < ActiveRecord::Base
  belongs_to :country
  has_many :airports
  has_many :international_airports, -> { where flightable:1 }, class_name: "Airport"


  def name_with_country
    return "#{self.name}, #{self.country.name}"
  end

  def name_with_country_code
    return "#{self.name}, #{self.country.code.titlecase}"
  end
  

  def name_with_country_emoji_and_code
    return "#{self.country.emoji} #{self.name}(#{self.code})"
  end

  def name_with_country_emoji
    return "#{self.country.emoji} #{self.name}"
  end

  def name_with_country_name_and_emoji
    return "#{self.country.emoji} #{self.name}, #{self.country.name}"
  end


  def self.search(query)
    query = query.strip
    city = City.where("code like '%#{query}%'") if query.length <= 3
    city = City.where("name like '%#{query}%'") if (city.map{|c|}.count == 0 rescue true)
    return city

  end

  def picture
    return "https://photo.hotellook.com/static/cities/960x720/#{self.code}.auto"
  end

end
