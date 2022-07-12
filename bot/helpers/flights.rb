def get_location_from_entity(values)
  location = nil
  location = values[0][:resolved][:values][0][:name] rescue nil
  location = values[0][:value] if location.nil?
  return location
end

def get_array_of_dates_from_entity(values)
  values.map{|v| v[:value] || v[:from][:value] rescue nil}
end