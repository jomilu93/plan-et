json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :cuisine, :rating, :avg_price, :business_hours, :address, :phone_number, :city
end
