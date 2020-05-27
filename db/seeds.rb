# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

puts "Getting started..."

puts "Adding countries and cities..."

Pais.create!(
  id: 1,
  name: "Mexico")

City.create!(
  id:1,
  name: "CDMX",
  pais_id: 1)

Pais.create!(
  id: 2,
  name: "France")

City.create!(
  id:2,
  name: "Paris",
  pais_id: 2)

City.create!(
  id:3,
  name: "Mazatlan",
  pais_id: 1)

puts "Creating users..."

User.create!(
      id: 1,
      name: "David Osuna Azcona",
      email: "davidoad@gmail.com",
      password: "Caioloveforever",
      city_id: 3
      )

User.create!(
      id: 2,
      name: "Luis César",
      email: "lucszz@hotmail.com",
      password: "Daniisthebest",
      city_id: 1
      )

User.create!(
      id: 3,
      name: "Lou Malta",
      email: "lou@loumalta.com",
      password: "Iamanenterprise",
      city_id: 2
      )

user_photos = [
  "https://ca.slack-edge.com/T02NE0241-USJN29P37-b5e12ae43732-512",
  "https://ca.slack-edge.com/T02NE0241-USLQMFXQW-d75b7fa57d68-512",
  "https://ca.slack-edge.com/T02NE0241-USJ56UJRJ-168b78fa1838-512"
]

User.first.photos.attach(io: user_photos[0], filename: 'david.png', content_type: 'image/png')

User.second.photos.attach(io: user_photos[1], filename: 'luis.png', content_type: 'image/png')

User.third.photos.attach(io: user_photos[2], filename: 'lou.png', content_type: 'image/png')

puts "Creating trips..."

Trip.create!(
      id: 1,
      name: "Magical Mazatlán Weekend at David's Estate",
      start_date: '05/05/2020',
      end_date: '10/05/2020',
      user_id: 1
      )

Trip.create!(
      id: 2,
      name: "Parisian Paradise with Lou Malta",
      start_date: '10/06/2020',
      end_date: '11/06/2020',
      user_id: 2
      )

Trip.create!(
      id: 3,
      name: "Tepito Travesuras with Luis and Jose",
      start_date: '15/07/2020',
      end_date: '15/07/2020',
      user_id: 3
      )

trip_photos = [
  "https://rinconesdemexico.com/wp-content/uploads/shutterstock_1073392151-1.jpg",
  "https://images.adsttc.com/media/images/5d44/14fa/284d/d1fd/3a00/003d/newsletter/eiffel-tower-in-paris-151-medium.jpg?1564742900",
  "https://149361004.v2.pressablecdn.com/wp-content/uploads/2018/10/TepitoGaleria3.jpg"
]

Trip.first.photos.attach(io: trip_photos[0], filename: 'mazatlan.jpg', content_type: 'image/jpg')

Trip.second.photos.attach(io: trip_photos[1], filename: 'paris.jpg', content_type: 'image/jpg')

Trip.third.photos.attach(io: trip_photos[2], filename: 'tepito.jpg', content_type: 'image/jpg')

puts "Creating restaurants..."

Restaurant.create!(
      id: 1,
      name: "La Fonda Golosa",
      address: "Atrasito de la Lagunilla.",
      cuisine: "Mexican Streetfood",
      rating: 5,
      avg_price: 50,
      phone_number: "5542132416",
      business_hours: "11:00am to 5:00pm",
      city_id: 1
  )

restaurant_photos = [
"https://culinarybackstreets-com.exactdn.com/wp-content/uploads/cb_mc_fonda_margarita_pjr_final.jpg?lossy=1&ssl=1"
]

Restaurant.first.photos.attach(io: restaurant_photos[0], filename: 'fonda.jpg', content_type: 'image/jpg')

puts "Creating meals..."

Meal.create!(
    id: 1,
    name: "Breakfast at Tiffany's (also known as David's)",
    address: "500 meters west of the paved road.",
    restaurant_id: 1,
    city_id: 3
    )

Meal.create!(
    id: 2,
    name: "Comida en Fonda Golosa",
    address: "Al ladito de la Lagunilla",
    restaurant_id: 1,
    city_id: 1
    )

#Transportation.create!(
#      id: 1,
#      transportation_type: "Flight",
#      origin_city_id: 1,
#      destination_city_id: 2
#      )

puts "Creating others..."


Other.create!(
      id: 1,
      name: "A walk down the malecón where David gets whistled at.",
      address: "Next to David's home.",
      city_id: 3
      )

Other.create!(
      id: 2,
      name: "Sailing overnight trip with Mr. Neto Osuna.",
      address: "On a boat",
      city_id: 3
      )

Other.create!(
      id: 3,
      name: "Wine and bread on the river with Lou's possy.",
      address: "River Senne",
      city_id: 2
      )

Other.create!(
      id: 4,
      name: "Get mugged by locals",
      address: "The heart of Tepito",
      city_id: 1
      )

puts "Creating attractions..."

Attraction.create!(
      id: 1,
      name: "Lou's Louvre",
      address: "Next to the river.",
      attraction_type: "Museum",
      city_id: 2
      )

attraction_photos = [
"https://i1.wp.com/thehappening.com/wp-content/uploads/2019/11/museo-louvre.jpg?fit=1024%2C694&ssl=1"
]

Attraction.first.photos.attach(io: attraction_photos[0], filename: 'louvre.jpg', content_type: 'image/jpg')


puts "Creating hotels..."


Hotel.create!(
    id: 1,
    name: "LeWagon AKA Andrea and Nacho's Mansion",
    address: "Chihuahua no se que",
    phone_number: "5555555",
    rating: 7,
    city_id: 1
    )

hotel_photos = [
"https://res.cloudinary.com/wagon/image/upload/v1574889737/zmaoco0qgyhwqf4lngp2.jpg"
]

Hotel.first.photos.attach(io: hotel_photos[0], filename: 'lewagon.jpg', content_type: 'image/jpg')


puts "Creating accomodations..."


Accomodation.create!(
    id: 1,
    name: "Stay at CDMX",
    address: "See hotel address",
    hotel_id: 1,
    city_id: 1
    )

puts "Creating first trip..."


Part.create!(
    id: 1,
    start_date: '05/05/2020',
    end_date: '10/05/2020',
    name: "Get to know Mazatlán",
    trip_id: 1,
    city_id: 3)

Part.create!(
    id: 2,
    start_date: '11/05/2020',
    end_date: '15/05/2020',
    name: "Get involved in the local gangs",
    trip_id: 1,
    city_id: 3)

Activity.create!(
      id: 1,
      start_time: '05/05/2020 09:00:00',
      end_time: '05/05/2020 11:00:00',
      activityable_type: 'Meal',
      activityable_id: 1,
      part_id: 1
      )

Activity.create!(
      id: 2,
      start_time: '05/05/2020 13:00:00',
      end_time: '05/05/2020 15:00:00',
      activityable_type: 'Other',
      activityable_id: 1,
      part_id: 1
      )

Activity.create!(
      id: 3,
      start_time: '08/05/2020 08:00:00',
      end_time: '09/05/2020 18:00:00',
      activityable_type: 'Other',
      activityable_id: 2,
      part_id: 2
      )

puts "Creating second trip..."


Part.create!(
    id: 3,
    start_date: '10/06/2020',
    end_date: '10/06/2020',
    name: "Travel from CDMX to Paris.",
    trip_id: 2,
    city_id: 2)

Part.create!(
    id: 4,
    start_date: '11/06/2020',
    end_date: '11/06/2020',
    name: "Explore Paris, the Mexico City of Europe.",
    trip_id: 2,
    city_id: 2)

#Activity.create!(
#      id: 4,
#      start_time: '10/06/2020 08:00:00',
#      end_time: '10/06/2020 15:00:00',
#      activityable_type: 'Transportation',
#      activityable_id: 1,
#      part_id: 3
#      )

Activity.create!(
      id: 5,
      start_time: '10/06/2020 16:00:00',
      end_time: '10/06/2020 18:00:00',
      activityable_type: 'Attraction',
      activityable_id: 1,
      part_id: 4
      )

Activity.create!(
      id: 6,
      start_time: '11/06/2020 20:00:00',
      end_time: '11/06/2020 23:00:00',
      activityable_type: 'Other',
      activityable_id: 3,
      part_id: 4
      )

puts "Creating third trip..."


Part.create!(
    id: 5,
    start_date: '15/07/2020',
    end_date: '15/07/2020',
    name: "Tepito Thursday",
    trip_id: 3,
    city_id: 1)

Activity.create!(
      id: 7,
      start_time: '15/07/2020 15:00:00',
      end_time: '15/07/2020 17:00:00',
      activityable_type: 'Restaurant',
      activityable_id: 1,
      part_id: 5
      )

Activity.create!(
      id: 8,
      start_time: '15/07/2020 17:30:00',
      end_time: '15/07/2020 18:00:00',
      activityable_type: 'Other',
      activityable_id: 4,
      part_id: 5
      )







