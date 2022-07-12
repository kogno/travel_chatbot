class Location < ActiveRecord::Base
  belongs_to :country
  belongs_to :city

  def self.search(query)

    return [] if query.empty?

    location = []
    location = Country.where("name like '#{query}'")
    location = City.where("name like '%#{query}%'") if location.empty?
    return location unless location.empty?
    words = query.gsub(","," ").split(" ")
    if words.count  == 1
      word = words.first
      if word.length <= 3
        location = City.where("code = '#{word.upcase}'")
        location = Country.where("code = '#{word.upcase}'") if location.to_a.count == 0
      else
        location = Country.where("name like '#{word}'") if location.to_a.count == 0
        location = City.where("name like '%#{word}%'") if location.to_a.count == 0
      end
    else
      where = "#{where}#{words.map{|word| "MATCH(name) AGAINST('#{word}')" if word.length > 2}.compact.join(" and ")}"      
      location = Location.where(where).includes(:city).map{|l| l.city} unless where.empty?
    end

    return location
  end

end
