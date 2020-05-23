# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
      id: 1,
      name: "David Osuna Azcona",
      email: "davidoad@gmail.com",
      password: "Caioloveforever",
      location: "Mazatlán, Sinaloa, México"
      )

User.create(
      id: 2,
      name: "Luis César",
      email: "lucszz@hotmail.com",
      password: "Daniisthebest",
      location: "Aristoteles, México"
      )

User.create(
      id: 3,
      name: "Lou Malta",
      email: "lou@loumalta.com",
      password: "Iamanenterprise",
      location: "Also Aristoteles, México"
      )


Itinerary.create(
      trip_name: "Magical Mazatlán Weekend at David's Estate",
      country: "Mexico",
      start_date: '05/05/2020',
      end_date: '10/05/2020',
      id: 1,
      user_id: 1
      )

Itinerary.create(
      trip_name: "Parisian Paradise with Lou Malta",
      country: "Paris",
      start_date: '10/06/2020',
      end_date: '11/06/2020',
      id: 2,
      user_id: 2
      )

Itinerary.create(
      trip_name: "Tepito Travesuras with Luis and Jose",
      country: "Tepito",
      start_date: '15/07/2020',
      end_date: '15/07/2020',
      id: 3,
      user_id: 3
      )

Restaurant.create(
      id: 1,
      name: "David's casa",
      address: "500 meters west of the paved road.",
      cuisine: "Mazatleco food",
      rating: 6,
      price: 250,
      phone_number: 56618382,
  )

Restaurant.create(
      id: 2,
      name: "La Fonda Golosa",
      address: "Atrasito de la Lagunilla.",
      cuisine: "Mexican Streetfood",
      rating: 4.5,
      price: 50,
      phone_number: 5542132416
  )

Transit.create(
      id: 1,
      transportation_type: "Flight",
      origin: "Mexico City",
      destination: "Paris"
      )

Other.create(
      id: 1)

Other.create(
      id: 2)

Other.create(
      id: 3)

Other.create(
      id: 4)

Attraction.create(
      id: 1,
      name: "Lou's Louvre",
      address: "Next to the river.",
      rating: 5,
      price: 1000,
      phone_number: 530823410
      )

Activity.create(
      id: 1,
      name: "Mazatlán huevos montados",
      description: "You can finally try David's favorite breakfast.",
      start_time: '05/05/2020 09:00:00',
      end_time: '05/05/2020 11:00:00',
      activityable_type: 'Restaurant',
      activityable_id: 1,
      itinerary_id: 1
      )

Activity.create(
      id: 2,
      name: "A walk down the malecón where David gets whistled at.",
      description: "He's popular and you can feel it.",
      start_time: '05/05/2020 13:00:00',
      end_time: '05/05/2020 15:00:00',
      activityable_type: 'Other',
      activityable_id: 1,
      itinerary_id: 1
      )

Activity.create(
      id: 3,
      name: "Sailing overnight trip with Mr. Neto Osuna",
      description: "Enjoy the trip and learn all of David's embarrassing stories.",
      start_time: '08/05/2020 08:00:00',
      end_time: '09/05/2020 18:00:00',
      activityable_type: 'Other',
      activityable_id: 2,
      itinerary_id: 1
      )

Activity.create(
      id: 4,
      name: "Flight from MEX to CDG",
      description: "You better be flying Delta or Aeromexico...",
      start_time: '10/06/2020 08:00:00',
      end_time: '10/06/2020 15:00:00',
      activityable_type: 'Transit',
      activityable_id: 1,
      itinerary_id: 2
      )

Activity.create(
      id: 5,
      name: "Guided tour of Lou's Louvre",
      description: "Yes...she owns it",
      start_time: '10/06/2020 16:00:00',
      end_time: '10/06/2020 18:00:00',
      activityable_type: 'Attraction',
      activityable_id: 1,
      itinerary_id: 2
      )

Activity.create(
      id: 6,
      name: "Wine and bread on the river with Lou's possy.",
      description: "If you though David was famous...",
      start_time: '11/06/2020 20:00:00',
      end_time: '11/06/2020 23:00:00',
      activityable_type: 'Other',
      activityable_id: 3,
      itinerary_id: 2
      )

Activity.create(
      id: 7,
      name: "Eat at La Gorda's Fonda Golosa.",
      description: "If your stomach is okay after this, you did something wrong.",
      start_time: '15/07/2020 15:00:00',
      end_time: '15/07/2020 17:00:00',
      activityable_type: 'Restaurant',
      activityable_id: 2,
      itinerary_id: 3
      )

Activity.create(
      id: 8,
      name: "Get mugged by locals",
      description: "It's nothing personal, it's just Tepito.",
      start_time: '15/07/2020 17:30:00',
      end_time: '15/07/2020 18:00:00',
      activityable_type: 'Other',
      activityable_id: 4,
      itinerary_id: 3
      )



#BODY_BLOCK_JQUERY_REFLOW > div.page > div > div.ui_container.main_wrap > div > div > div > div > div.content_column.ui_column.is-9-desktop.is-12-tablet.is-12-mobile > div > div.ui_columns.sections_wrapper > div > div:nth-child(5) > div > div.main_content.ui_column.is-12 > div > div:nth-child(2) > div > div > div:nth-child(6) > div > div > div > div.ui_column.is-9-desktop.is-8-mobile.is-9-tablet.content-block-column > div.location-meta-block > div.result-title





