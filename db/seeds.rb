require 'json'
require "open-uri"
require 'restcountry'
require 'nokogiri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

puts "Getting started..."

puts "Adding countries..."

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
  puts "City #{City.last.id} complete"

  end
end

City.create!(
    name: "Mazatlán",
    pais_id: Pais.where(name: "Mexico").ids[0]
    )


def variable_test
  begin
    yield
  rescue
    "No data"
  end
end

puts "Adding Mexico City hotels..."

url = "http://www.tripadvisor.com/Hotels-g150800-Mexico_City_Central_Mexico_and_Gulf_Coast-Hotels.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.css("div.listing.collapsed").each do |listing|

  url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  name = variable_test {listing.css(".listing_title a").text}
  address = variable_test {html_doc_sub.css("span.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span.public-business-listing-ContactInfo__nonWebLinkText--nGymU.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
  rating = variable_test{listing.css("div.prw_rup.prw_common_rating_and_review_count_with_popup.linespace.is-shown-at-mobile")[0].children[0]["alt"].chars[0..2].join.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: 145)

  puts "Hotel #{Hotel.last.id} complete"
  # #average_price
  # puts listing.css("div.premium_offer_container")[0].children[0]["data-pernight"].to_i
end

puts "Adding Paris hotels..."

url = "http://www.tripadvisor.com/Hotels-g187147-Paris_Ile_de_France-Hotels.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.css("div.listing.collapsed").each do |listing|

  url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  name = variable_test {listing.css(".listing_title a").text}
  address = variable_test {html_doc_sub.css("span.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span.public-business-listing-ContactInfo__nonWebLinkText--nGymU.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
  rating = variable_test{listing.css("div.prw_rup.prw_common_rating_and_review_count_with_popup.linespace.is-shown-at-mobile")[0].children[0]["alt"].chars[0..2].join.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: 78)

  puts "Hotel #{Hotel.last.id} complete"
  # #average_price
  # puts listing.css("div.premium_offer_container")[0].children[0]["data-pernight"].to_i
end

puts "Adding Mazatlán hotels..."

url = "http://www.tripadvisor.com/Hotels-g150792-Mazatlan_Pacific_Coast-Hotels.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.css("div.listing.collapsed").each do |listing|

  url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  name = variable_test {listing.css(".listing_title a").text}
  address = variable_test {html_doc_sub.css("span.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span.public-business-listing-ContactInfo__nonWebLinkText--nGymU.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
  rating = variable_test{listing.css("div.prw_rup.prw_common_rating_and_review_count_with_popup.linespace.is-shown-at-mobile")[0].children[0]["alt"].chars[0..2].join.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: City.last.id)

  puts "Hotel #{Hotel.last.id} complete"
  # #average_price
  # puts listing.css("div.premium_offer_container")[0].children[0]["data-pernight"].to_i
end



# MULTI-PAGE SCRAPE
# page_number = 30
# is_next = true

# while is_next

#   begin

#     url = "http://www.tripadvisor.com/Hotels-g150800-oa#{page_number}-Mexico_City_Central_Mexico_and_Gulf_Coast-Hotels.html"

#     html_file = open(url).read
#     html_doc = Nokogiri::HTML(html_file)

#     html_doc.css("div.listing.collapsed").each do |listing|

#       url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
#       html_file_sub = open(url_sub).read
#       html_doc_sub = Nokogiri::HTML(html_file_sub)

#       name = variable_test {listing.css(".listing_title a").text}
#       address = variable_test {html_doc_sub.css("span.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
#       phone_number = variable_test{html_doc_sub.css("span.public-business-listing-ContactInfo__nonWebLinkText--nGymU.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
#       rating = variable_test{listing.css("div.prw_rup.prw_common_rating_and_review_count_with_popup.linespace.is-shown-at-mobile")[0].children[0]["alt"].chars[0..2].join.to_f}

#       Hotel.create!(
#         name: "#{name}",
#         address:"#{address}",
#         phone_number: "#{phone_number}",
#         rating: rating,
#         city_id: 145)
#     end

#     page_number += 30

#   rescue

#   is_next = false

#   end

# end

puts "Adding Mexico City attractions..."

url = "http://www.tripadvisor.com/Attractions-g150800-Activities-a_allAttractions.true-Mexico_City_Central_Mexico_and_Gulf_Coast.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div.attractions-attraction-filtered-main-index__listItem--3trCl.attractions-attraction-filtered-main-index__paddingDesktop--2kSx8").each do |listing|
  name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
  attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

  url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css(".attractions-contact-card-ContactCard__contactRow--3Ih6v").children[1].inner_html}
  #phone_number
  #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

  Attraction.create!(
        name: "#{name}",
        address:"#{address}",
        attraction_type: "#{attraction_type}",
        city_id: 145)

  puts "Attraction #{Attraction.last.id} complete"

end

# puts "Adding Paris attractions..."

# url = "http://www.tripadvisor.com/Attractions-g187147-Activities-Paris_Ile_de_France.html"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# puts html_doc.css("li.attractions-attraction-overview-pois-PoiCard__item--3UzYK")[0]

# html_doc.css("li.attractions-attraction-overview-pois-PoiCard__item--3UzYK").each do |listing|

#   url_sub = "http://www.tripadvisor.com.mx/#{listing.css("a.attractions-attraction-overview-pois-PoiInfo__name--SJ0a4")["href"]}"
#   html_file_sub = open(url_sub).read
#   html_doc_sub = Nokogiri::HTML(html_file_sub)

#   name = variable_test {html_doc_sub.css("h1.ui_header.h1").inner_html}
#   p name
#   attraction_type = variable_test {html_doc_sub.css("a.attractions-attraction-review-header-AttractionLinks__dotted_link--Pt2MP").inner_html}
#   p attraction_type
#   address = variable_test {html_doc_sub.css("div.attractions-contact-card-ContactCard__contactRow--3Ih6v").children[1].inner_html}
#   p address
#   #phone_number
#   #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

#   Attraction.create!(
#         name: "#{name}",
#         address:"#{address}",
#         attraction_type: "#{attraction_type}",
#         city_id: 78)

#   puts "Attraction #{Attraction.last.id} complete"

# end

# puts "Adding Mazatlán attractions..."

# url = "http://www.tripadvisor.com/Attractions-g150792-Activities-Mazatlan_Pacific_Coast.html"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.css("div.attractions-attraction-filtered-main-index__listItem--3trCl.attractions-attraction-filtered-main-index__paddingDesktop--2kSx8").each do |listing|
#   name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
#   attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

#   url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
#   html_file_sub = open(url_sub).read
#   html_doc_sub = Nokogiri::HTML(html_file_sub)

#   address = variable_test {html_doc_sub.css(".attractions-contact-card-ContactCard__contactRow--3Ih6v").children[1].inner_html}
#   #phone_number
#   #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

#   Attraction.create!(
#         name: "#{name}",
#         address:"#{address}",
#         attraction_type: "#{attraction_type}",
#         city_id: City.last.id)

#   puts "Attraction #{Attraction.last.id} complete"

# end

# MULTI-PAGE SCRAPE
# page_number = 30
# is_next = true

# while is_next

#   begin

#     url = "http://www.tripadvisor.com/Attractions-g150800-Activities-oa#{page_number}-a_allAttractions.true-Mexico_City_Central_Mexico_and_Gulf_Coast.html"

#     html_file = open(url).read
#     html_doc = Nokogiri::HTML(html_file)

#     puts "html read successfully!"

#     html_doc.css("div.attractions-attraction-filtered-main-index__listItem--3trCl.attractions-attraction-filtered-main-index__paddingDesktop--2kSx8").each do |listing|
#       name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
#       attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

#       url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
#       html_file_sub = open(url_sub).read
#       html_doc_sub = Nokogiri::HTML(html_file_sub)

#       address = variable_test {html_doc_sub.css(".attractions-contact-card-ContactCard__contactRow--3Ih6v").children[1].inner_html}
#       #phone_number
#       #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

#       Attraction.create!(
#             name: "#{name}",
#             address:"#{address}",
#             attraction_type: "#{attraction_type}",
#             city_id: 145)

#       puts "Attraction #{Attraction.last.id}complete"

#     end

#     page_number += 30

#   rescue

#   is_next = false

#   end

# end

puts "Adding Mexico City restaurants..."

url = "http://www.tripadvisor.com/Restaurants-g150800-Mexico_City_Central_Mexico_and_Gulf_Coast.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._1llCuDZj").each do |listing|
  name = variable_test { listing.css("a._15_ydu6b").inner_html.gsub(/[.!\d<>-]/, '').strip}
  cuisine = variable_test {listing.css("span._1p0FLy4t")[2].inner_html}
  avg_price = variable_test {listing.css("span._1p0FLy4t")[3].inner_html }

  url_sub = "http://www.tripadvisor.com/#{listing.css("a._15_ydu6b")[0]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("a.restaurants-detail-top-info-TopInfo__infoCellLink--2ZRPG")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.restaurants-detail-overview-cards-RatingsOverviewCard__overallRating--nohTl").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: 145)

  puts "Restaurant #{Restaurant.last.id} complete"

end

puts "Adding Paris restaurants..."

url = "http://www.tripadvisor.com/Restaurants-g187147-Paris_Ile_de_France.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._1llCuDZj").each do |listing|
  name = variable_test { listing.css("a._15_ydu6b").inner_html.gsub(/[.!\d<>-]/, '').strip}
  cuisine = variable_test {listing.css("span._1p0FLy4t")[2].inner_html}
  avg_price = variable_test {listing.css("span._1p0FLy4t")[3].inner_html }

  url_sub = "http://www.tripadvisor.com/#{listing.css("a._15_ydu6b")[0]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("a.restaurants-detail-top-info-TopInfo__infoCellLink--2ZRPG")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.restaurants-detail-overview-cards-RatingsOverviewCard__overallRating--nohTl").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: 78)

  puts "Restaurant #{Restaurant.last.id} complete"

end

puts "Adding Mazatlán restaurants..."

url = "http://www.tripadvisor.com/Restaurants-g150792-Mazatlan_Pacific_Coast.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._1llCuDZj").each do |listing|
  name = variable_test { listing.css("a._15_ydu6b").inner_html.gsub(/[.!\d<>-]/, '').strip}
  cuisine = variable_test {listing.css("span._1p0FLy4t")[2].inner_html}
  avg_price = variable_test {listing.css("span._1p0FLy4t")[3].inner_html }

  url_sub = "http://www.tripadvisor.com/#{listing.css("a._15_ydu6b")[0]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("a.restaurants-detail-top-info-TopInfo__infoCellLink--2ZRPG")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.restaurants-detail-overview-cards-RatingsOverviewCard__overallRating--nohTl").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: City.last.id)

  puts "Restaurant #{Restaurant.last.id} complete"

end

# MULTI-PAGE SCRAPE
# puts "Creating users..."

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

# restaurant_photo = [
# "https://culinarybackstreets-com.exactdn.com/wp-content/uploads/cb_mc_fonda_margarita_pjr_final.jpg?lossy=1&ssl=1"
# ]

# Restaurant.all.each do |restaurant|
#   file = URI.open(restaurant_photo[restaurant.id - 1])
#   restaurant.photo.attach(io: file, filename: 'restaurant.png', content_type: 'image/png')
# end

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


# attraction_photo = [
# "https://i1.wp.com/thehappening.com/wp-content/uploads/2019/11/museo-louvre.jpg?fit=1024%2C694&ssl=1"
# ]

# Attraction.all.each do |attraction|
#   file = URI.open(attraction_photo[attraction.id - 1])
#   attraction.photo.attach(io: file, filename: 'attraction.png', content_type: 'image/png')
# end


# hotel_photo = [
# "https://res.cloudinary.com/wagon/image/upload/v1574889737/zmaoco0qgyhwqf4lngp2.jpg"
# ]

# Hotel.all.each do |hotel|
#   file = URI.open(hotel_photo[hotel.id - 1])
#   hotel.photo.attach(io: file, filename: 'hotel.png', content_type: 'image/png')
# end

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







