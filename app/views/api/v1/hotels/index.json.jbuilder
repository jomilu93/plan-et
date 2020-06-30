json.array! @hotels do |hotel|
  json.extract! hotel, :id, :name, :address, :phone_number, :rating, :city
end
