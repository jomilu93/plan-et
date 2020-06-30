json.array! @attractions do |attraction|
  json.extract! attraction, :id, :name, :address, :attraction_type, :city
end
