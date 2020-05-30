require 'json'
require "open-uri"
require 'restcountry'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

puts "Getting started..."

puts "Adding countries..."

#url = "https://restcountries.eu/rest/v2/all"
#serialized_countries = open(url).read
#countries = JSON.parse(serialized_countries)

#countries.each do |country|
#  Pais.create!(
#    name: "#{country["name"]}"
#    )
#end

Restcountry::Country.all.each do |country|
  Pais.create!(
    name: "#{country.name}"
    )
end

puts "Adding cities..."

Restcountry::Country.all.each do |country|
  if country.capital == ""
    next
  else
  City.create!(
    name: "#{country.capital}",
    pais_id: Pais.where(name: "#{country.name}").ids[0]
    )
  end
end

puts "Creating users..."

User.create!(
      name: "David Osuna Azcona",
      email: "davidoad@gmail.com",
      password: "contrasena",
      city_id: 3
      )

User.create!(
      name: "Luis César",
      email: "luis@gmail.com",
      password: "contrasena",
      city_id: 1
      )

User.create!(
      name: "Lou Malta",
      email: "lou@loumalta.com",
      password: "contrasena",
      city_id: 2
      )

user_photo = [
  "https://yt3.ggpht.com/a/AGF-l7-P-saR-nR4ly5s5KL_VIQL3lhb5FHJ8A2Kug=s900-c-k-c0xffffffff-no-rj-mo",
  "https://format-com-cld-res.cloudinary.com/image/private/s--pqOVfyT1--/c_crop,h_950,w_713,x_0,y_0/c_fill,g_center,h_506,w_380/fl_keep_iptc.progressive,q_95/v1/181a169d94261ee7ef97a047ede4ebc5/2653SBF7_010_2.jpg",
  "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2017/06/15/14975546611983.jpg"
]

User.all.each do |user|
  file = URI.open(user_photo[user.id - 1])
  user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end

puts "Creating trips..."

Trip.create!(
      name: "Magical Mazatlán Weekend at David's Estate",
      description: "Imagine if the Queen showed you around England...then multiply it by 10. David is both a Mazatlan local and a travel expert. He will take you to the beach, to a climb a cerro, eat seafood and even go dancing at night.",
      start_date: '05/05/2020',
      end_date: '10/05/2020',
      user_id: 1
      )

Trip.create!(
      name: "Parisian Paradise with Lou Malta",
      description: "There's class and then there is Paris with Lou Malta. She will take you on a tour of the river, she will show you the best and most chic spots to eat, she knows every walking tour there is and...to top it all off, she owns most art galleries in Paris so you are ready for an art treat.",
      start_date: '10/06/2020',
      end_date: '11/06/2020',
      user_id: 2
      )

Trip.create!(
      name: "Tepito Travesuras with Luis and Jose",
      description: "Do you think danger is exciting? Do you believe in la santa muerte? Folklor, street food, traditions, insecurity, this much and more with Luis and Jose in Tepito.",
      start_date: '15/07/2020',
      end_date: '15/07/2020',
      user_id: 3
      )

Trip.create!(
      name: "Xochimilco Shenanigans",
      description: "Tequila, beer and dirty water -- what can be better than this? Singing, dancing, swimming (at your own risk) and a great chance to spend time with friends.",
      start_date: '19/07/2020',
      end_date: '19/07/2020',
      user_id: 1
      )

Trip.create!(
      name: "Adventures in the Amazon",
      description: "Nature, adventure, indigenous tribes...this trip is not for the faint of heart but it will change the way you look at the mundane, concrete jungle you call a home.",
      start_date: '01/08/2020',
      end_date: '10/08/2020',
      user_id: 2
      )

Trip.create!(
      name: "Veracruz Vacations with Nacho",
      description: "It is rumored that Nacho's family invented the old man dance...must I say more? Tons of seafood, traditions, culture and history to be found here.",
      start_date: '12/10/2020',
      end_date: '15/10/2020',
      user_id: 3
      )

Trip.create!(
      name: "Thanksgiving Turkey...in Turkey!",
      description: "Literally no one celebrates Thanksgiving in Turkey, but you can! Visit mosques and then go have some bacon. Explore the bazaar only to go eat some stuffing after. No one has done it before, you're welcome.",
      start_date: '20/11/2020',
      end_date: '30/11/2020',
      user_id: 1
      )

Trip.create!(
      name: "Kickass Kenyan Kwanza",
      description: "Cultural misappropriation at its finest. Go celebrate Kwanza instead of boring old Christmas. Africa's finest safaris, wild animals, nature and lots of heat no matter what time of the year it is -- but who doesn't love a grey, hot Christmas? Kwazna...sorry.",
      start_date: '24/12/2020',
      end_date: '31/12/2020',
      user_id: 2
      )

trip_photo = [
  "https://rinconesdemexico.com/wp-content/uploads/shutterstock_1073392151-1.jpg",
  "https://images.adsttc.com/media/images/5d44/14fa/284d/d1fd/3a00/003d/newsletter/eiffel-tower-in-paris-151-medium.jpg?1564742900",
  "https://149361004.v2.pressablecdn.com/wp-content/uploads/2018/10/TepitoGaleria3.jpg",
  "https://learnspanishinmexicocity.com/wp-content/uploads/2018/08/Xochimilco-1100-x-621.jpg",
  "https://s.france24.com/media/display/cbb598a4-f2e6-11e8-bb99-005056a964fe/w:1240/p:16x9/amazonia_brasilea.webp",
  "https://www.viajejet.com/wp-content/viajes/el-baile-de-los-viejitos-una-danza-mexicana-de-la-epoca-prehispanica.jpg",
  "https://www.worldatlas.com/r/w1200-h701-c1200x701/upload/2e/37/8a/shutterstock-291252509.jpg",
  "https://www.andbeyond.com/wp-content/uploads/sites/5/guest-area-with-golden-sunrise-at-andbeyond-bateleur-camp-on-a-luxury-kenya-safari-1920x1080.jpg"
]

Trip.all.each do |trip|
  file = URI.open(trip_photo[trip.id - 1])
  trip.photos.attach(io: file, filename: 'trip.png', content_type: 'image/png')
end

puts "Creating restaurants..."

Restaurant.create!(
      name: "La Fonda Golosa",
      address: "Atrasito de la Lagunilla.",
      cuisine: "Mexican Streetfood",
      rating: 5,
      avg_price: 50,
      phone_number: "5542132416",
      business_hours: "11:00am to 5:00pm",
      city_id: 1
  )

restaurant_photo = [
"https://culinarybackstreets-com.exactdn.com/wp-content/uploads/cb_mc_fonda_margarita_pjr_final.jpg?lossy=1&ssl=1"
]

Restaurant.all.each do |restaurant|
  file = URI.open(restaurant_photo[restaurant.id - 1])
  restaurant.photo.attach(io: file, filename: 'restaurant.png', content_type: 'image/png')
end

puts "Creating meals..."

Meal.create!(
    name: "Breakfast at Tiffany's (also known as David's)",
    address: "500 meters west of the paved road.",
    restaurant_id: 1,
    city_id: 3
    )

Meal.create!(
    name: "Comida en Fonda Golosa",
    address: "Al ladito de la Lagunilla",
    restaurant_id: 1,
    city_id: 1
    )

puts "Creating transportations..."


Transportation.create!(
      transportation_type: "Flight",
      origin_city_id: 1,
      destination_city_id: 2
      )

puts "Creating others..."


Other.create!(
      name: "A walk down the malecón where David gets whistled at.",
      address: "Next to David's home.",
      city_id: 3
      )

Other.create!(
      name: "Sailing overnight trip with Mr. Neto Osuna.",
      address: "On a boat",
      city_id: 3
      )

Other.create!(
      name: "Wine and bread on the river with Lou's possy.",
      address: "River Senne",
      city_id: 2
      )

Other.create!(
      name: "Get mugged by locals",
      address: "The heart of Tepito",
      city_id: 1
      )

puts "Creating attractions..."

Attraction.create!(
      name: "Lou's Louvre",
      address: "Next to the river.",
      attraction_type: "Museum",
      city_id: 2
      )

attraction_photo = [
"https://i1.wp.com/thehappening.com/wp-content/uploads/2019/11/museo-louvre.jpg?fit=1024%2C694&ssl=1"
]

Attraction.all.each do |attraction|
  file = URI.open(attraction_photo[attraction.id - 1])
  attraction.photo.attach(io: file, filename: 'attraction.png', content_type: 'image/png')
end

puts "Creating hotels..."


Hotel.create!(
    name: "LeWagon AKA Andrea and Nacho's Mansion",
    address: "Chihuahua no se que",
    phone_number: "5555555",
    rating: 7,
    city_id: 1
    )

hotel_photo = [
"https://res.cloudinary.com/wagon/image/upload/v1574889737/zmaoco0qgyhwqf4lngp2.jpg"
]

Hotel.all.each do |hotel|
  file = URI.open(hotel_photo[hotel.id - 1])
  hotel.photo.attach(io: file, filename: 'hotel.png', content_type: 'image/png')
end

puts "Creating accomodations..."


Accomodation.create!(
    name: "Stay at CDMX",
    address: "See hotel address",
    hotel_id: 1,
    city_id: 1
    )

puts "Creating first trip..."


Part.create!(
    start_date: '05/05/2020',
    end_date: '10/05/2020',
    name: "Get to know Mazatlán",
    trip_id: 1,
    city_id: 3)

Part.create!(
    start_date: '11/05/2020',
    end_date: '15/05/2020',
    name: "Get involved in the local gangs",
    trip_id: 1,
    city_id: 3)

Activity.create!(
      start_time: '05/05/2020 09:00:00',
      end_time: '05/05/2020 11:00:00',
      activityable_type: 'Meal',
      activityable_id: 1,
      part_id: 1
      )

Activity.create!(
      start_time: '05/05/2020 13:00:00',
      end_time: '05/05/2020 15:00:00',
      activityable_type: 'Other',
      activityable_id: 1,
      part_id: 1
      )

Activity.create!(
      start_time: '08/05/2020 08:00:00',
      end_time: '09/05/2020 18:00:00',
      activityable_type: 'Other',
      activityable_id: 2,
      part_id: 2
      )

puts "Creating second trip..."


Part.create!(
    start_date: '10/06/2020',
    end_date: '10/06/2020',
    name: "Travel from CDMX to Paris.",
    trip_id: 2,
    city_id: 2)

Part.create!(
    start_date: '11/06/2020',
    end_date: '11/06/2020',
    name: "Explore Paris, the Mexico City of Europe.",
    trip_id: 2,
    city_id: 2)

Activity.create!(
      start_time: '10/06/2020 08:00:00',
      end_time: '10/06/2020 15:00:00',
      activityable_type: 'Transportation',
      activityable_id: 1,
      part_id: 3
      )

Activity.create!(
      start_time: '10/06/2020 16:00:00',
      end_time: '10/06/2020 18:00:00',
      activityable_type: 'Attraction',
      activityable_id: 1,
      part_id: 4
      )

Activity.create!(
      start_time: '11/06/2020 20:00:00',
      end_time: '11/06/2020 23:00:00',
      activityable_type: 'Other',
      activityable_id: 3,
      part_id: 4
      )

puts "Creating third trip..."


Part.create!(
    start_date: '15/07/2020',
    end_date: '15/07/2020',
    name: "Tepito Thursday",
    trip_id: 3,
    city_id: 1)

Activity.create!(
      start_time: '15/07/2020 15:00:00',
      end_time: '15/07/2020 17:00:00',
      activityable_type: 'Restaurant',
      activityable_id: 1,
      part_id: 5
      )

Activity.create!(
      start_time: '15/07/2020 17:30:00',
      end_time: '15/07/2020 18:00:00',
      activityable_type: 'Other',
      activityable_id: 4,
      part_id: 5
      )







