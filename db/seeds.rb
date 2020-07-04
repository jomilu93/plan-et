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
    name: "#{country.name}",
    region: "#{country.region}",
    subregion: "#{country.subregion}"
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
    name: "Mazatlan",
    pais_id: Pais.where(name: "Mexico").ids[0]
    )


def variable_test
  begin
    yield
  rescue
    "No data"
  end
end

# # # puts "Adding countries and cities..."

# # # CS.countries.each do |country|
# # #   region = Restcountry::Country.find_by_name("#{country[1]}").region
# # #   subregion = Restcountry::Country.find_by_name("#{country[1]}").subregion
# # #   Pais.create!(
# # #     name: "#{country[1]}",
# # #     region: "#{region}",
# # #     subregion: "#{subregion}"
# # #     )
# # #   puts "Country #{Pais.last.id} complete"
# # #   CS.states(country[0]).each do |state|
# # #     CS.cities(state[0], country[0]).each do |city|
# # #       City.create!(
# # #       name: "#{city}",
# # #       pais_id: Pais.where(name: "#{country[1]}").ids[0]
# # #       )
# # #       puts "City #{City.last.id} complete"
# # #     end
# # #   end
# # # end


# # def variable_test
# #   begin
# #     yield
# #   rescue
# #     "No data"
# #   end
# # end

puts "Adding Mexico City hotels..."

url = "http://www.tripadvisor.com/Hotels-g150800-Mexico_City_Central_Mexico_and_Gulf_Coast-Hotels.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div.listing.collapsed").each do |listing|

  url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  name = variable_test {listing.css(".listing_title a").text}
  address = variable_test {html_doc_sub.css("span._3ErVArsu.jke2_wbp")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span._1_CU9UZ6._3ErVArsu.jke2_wbp")[0].inner_html}
  rating = variable_test{listing.css("span._3cjYfwwQ").inner_html.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: City.where(name:"Mexico City")[0].id
    )

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
  address = variable_test {html_doc_sub.css("span._3ErVArsu.jke2_wbp")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span._1_CU9UZ6._3ErVArsu.jke2_wbp")[0].inner_html}
  rating = variable_test{listing.css("span._3cjYfwwQ").inner_html.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: City.where(name:"Paris")[0].id
    )

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
  address = variable_test {html_doc_sub.css("span._3ErVArsu.jke2_wbp")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span._1_CU9UZ6._3ErVArsu.jke2_wbp")[0].inner_html}
  rating = variable_test{listing.css("span._3cjYfwwQ").inner_html.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: City.where(name:"Mazatlan")[0].id
    )

  puts "Hotel #{Hotel.last.id} complete"
#   # #average_price
#   # puts listing.css("div.premium_offer_container")[0].children[0]["data-pernight"].to_i
end

puts "Adding Nassau hotels..."

url = "http://www.tripadvisor.com/Hotels-g147416-Nassau_New_Providence_Island_Bahamas-Hotels.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.css("div.listing.collapsed").each do |listing|

  url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  name = variable_test {listing.css(".listing_title a").text}
  address = variable_test {html_doc_sub.css("span._3ErVArsu.jke2_wbp")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span._1_CU9UZ6._3ErVArsu.jke2_wbp")[0].inner_html}
  rating = variable_test{listing.css("span._3cjYfwwQ").inner_html.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: City.where(name:"Nassau")[0].id
    )

  puts "Hotel #{Hotel.last.id} complete"
#   # #average_price
#   # puts listing.css("div.premium_offer_container")[0].children[0]["data-pernight"].to_i
end

puts "Adding Kingston hotels..."

url = "http://www.tripadvisor.com/Hotels-g147310-Kingston_Kingston_Parish_Jamaica-Hotels.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.css("div.listing.collapsed").each do |listing|

  url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  name = variable_test {listing.css(".listing_title a").text}
  address = variable_test {html_doc_sub.css("span._3ErVArsu.jke2_wbp")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span._1_CU9UZ6._3ErVArsu.jke2_wbp")[0].inner_html}
  rating = variable_test{listing.css("span._3cjYfwwQ").inner_html.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: City.where(name:"Kingston")[0].id
    )

  puts "Hotel #{Hotel.last.id} complete"
#   # #average_price
#   # puts listing.css("div.premium_offer_container")[0].children[0]["data-pernight"].to_i
end

puts "Adding La Habana hotels..."

url = "http://www.tripadvisor.com/Hotels-g147271-Havana_Ciudad_de_la_Habana_Province_Cuba-Hotels.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)


html_doc.css("div.listing.collapsed").each do |listing|

  url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  name = variable_test {listing.css(".listing_title a").text}
  address = variable_test {html_doc_sub.css("span._3ErVArsu.jke2_wbp")[0].inner_html}
  phone_number = variable_test{html_doc_sub.css("span._1_CU9UZ6._3ErVArsu.jke2_wbp")[0].inner_html}
  rating = variable_test{listing.css("span._3cjYfwwQ").inner_html.to_f}
  # photo_url = variable_test {html_doc_sub.css("div.ZVAUHZqh")[0]["style"].to_s}
  # photo_url = photo_url.scan(/((https).*(\\))/)
  # p photo_url
  # photo = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  Hotel.create!(
    name: "#{name}",
    address:"#{address}",
    phone_number: "#{phone_number}",
    rating: rating,
    city_id: City.where(name:"Havana")[0].id
    )

  puts "Hotel #{Hotel.last.id} complete"
#   # #average_price
#   # puts listing.css("div.premium_offer_container")[0].children[0]["data-pernight"].to_i
end



# # MULTI-PAGE SCRAPE
# # page_number = 30
# # is_next = true

# # while is_next

# #   begin

# #     url = "http://www.tripadvisor.com/Hotels-g150800-oa#{page_number}-Mexico_City_Central_Mexico_and_Gulf_Coast-Hotels.html"

# #     html_file = open(url).read
# #     html_doc = Nokogiri::HTML(html_file)

# #     html_doc.css("div.listing.collapsed").each do |listing|

# #       url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
# #       html_file_sub = open(url_sub).read
# #       html_doc_sub = Nokogiri::HTML(html_file_sub)

# #       name = variable_test {listing.css(".listing_title a").text}
# #       address = variable_test {html_doc_sub.css("span.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
# #       phone_number = variable_test{html_doc_sub.css("span.public-business-listing-ContactInfo__nonWebLinkText--nGymU.public-business-listing-ContactInfo__ui_link--1_7Zp.public-business-listing-ContactInfo__level_4--3JgmI")[0].inner_html}
# #       rating = variable_test{listing.css("div.prw_rup.prw_common_rating_and_review_count_with_popup.linespace.is-shown-at-mobile")[0].children[0]["alt"].chars[0..2].join.to_f}

# #       Hotel.create!(
# #         name: "#{name}",
# #         address:"#{address}",
# #         phone_number: "#{phone_number}",
# #         rating: rating,
# #         city_id: 145)
# #     end

# #     page_number += 30

# #   rescue

# #   is_next = false

# #   end

# # end

puts "Adding Mexico City attractions..."

url = "http://www.tripadvisor.com/Attractions-g150800-Activities-a_allAttractions.true-Mexico_City_Central_Mexico_and_Gulf_Coast.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._25PvF8uO._2X44Y8hm").each do |listing|
  name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
  attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

  url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("div.LjCWTZdN").children[1].inner_html}
  #phone_number
  #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

  Attraction.create!(
        name: "#{name}",
        address:"#{address}",
        attraction_type: "#{attraction_type}",
        city_id: City.where(name:"Mexico City")[0].id
        )

  puts "Attraction #{Attraction.last.id} complete"

end

puts "Adding Paris attractions..."

url = "https://www.tripadvisor.com/Attractions-g187147-Activities-a_allAttractions.true-Paris_Ile_de_France.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._25PvF8uO._2X44Y8hm").each do |listing|
  name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
  attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

  url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("div.LjCWTZdN").children[1].inner_html}
  #phone_number
  #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

  Attraction.create!(
        name: "#{name}",
        address:"#{address}",
        attraction_type: "#{attraction_type}",
        city_id: City.where(name:"Paris")[0].id
        )

  puts "Attraction #{Attraction.last.id} complete"

end

puts "Adding Mazatlán attractions..."

url = "https://www.tripadvisor.com/Attractions-g150792-Activities-a_allAttractions.true-Mazatlan_Pacific_Coast.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._25PvF8uO._2X44Y8hm").each do |listing|
  name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
  attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

  url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("div.LjCWTZdN").children[1].inner_html}
  #phone_number
  #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

  Attraction.create!(
        name: "#{name}",
        address:"#{address}",
        attraction_type: "#{attraction_type}",
        city_id: City.where(name:"Mazatlan")[0].id
        )

  puts "Attraction #{Attraction.last.id} complete"

end

puts "Adding Nassau attractions..."

url = "https://www.tripadvisor.com/Attractions-g147416-Activities-a_allAttractions.true-Nassau_New_Providence_Island_Bahamas.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._25PvF8uO._2X44Y8hm").each do |listing|
  name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
  attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

  url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("div.LjCWTZdN").children[1].inner_html}
  #phone_number
  #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

  Attraction.create!(
        name: "#{name}",
        address:"#{address}",
        attraction_type: "#{attraction_type}",
        city_id: City.where(name:"Nassau")[0].id
        )

  puts "Attraction #{Attraction.last.id} complete"

end


puts "Adding Kingston attractions..."

url = "https://www.tripadvisor.com/Attractions-g147310-Activities-a_allAttractions.true-Kingston_Kingston_Parish_Jamaica.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._25PvF8uO._2X44Y8hm").each do |listing|
  name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
  attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

  url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("div.LjCWTZdN").children[1].inner_html}
  #phone_number
  #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

  Attraction.create!(
        name: "#{name}",
        address:"#{address}",
        attraction_type: "#{attraction_type}",
        city_id: City.where(name:"Kingston")[0].id
        )

  puts "Attraction #{Attraction.last.id} complete"

end


puts "Adding La Habana attractions..."

url = "https://www.tripadvisor.com/Attractions-g147271-Activities-a_allAttractions.true-Havana_Ciudad_de_la_Habana_Province_Cuba.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._25PvF8uO._2X44Y8hm").each do |listing|
  name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
  attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

  url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("div.LjCWTZdN").children[1].inner_html}
  #phone_number
  #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

  Attraction.create!(
        name: "#{name}",
        address:"#{address}",
        attraction_type: "#{attraction_type}",
        city_id: City.where(name:"Havana")[0].id
        )

  puts "Attraction #{Attraction.last.id} complete"

end

# # MULTI-PAGE SCRAPE
# # page_number = 30
# # is_next = true

# # while is_next

# #   begin

# #     url = "http://www.tripadvisor.com/Attractions-g150800-Activities-oa#{page_number}-a_allAttractions.true-Mexico_City_Central_Mexico_and_Gulf_Coast.html"

# #     html_file = open(url).read
# #     html_doc = Nokogiri::HTML(html_file)

# #     puts "html read successfully!"

# #     html_doc.css("div.attractions-attraction-filtered-main-index__listItem--3trCl.attractions-attraction-filtered-main-index__paddingDesktop--2kSx8").each do |listing|
# #       name = variable_test {listing.children[0].children[1].children[1].children[0].inner_html}
# #       attraction_type = variable_test {listing.children[0].children[1].children[0].children[0].children[0].children[0].inner_html}

# #       url_sub = "http://www.tripadvisor.com.mx/#{listing.children[0].children[1].children[1]["href"]}"
# #       html_file_sub = open(url_sub).read
# #       html_doc_sub = Nokogiri::HTML(html_file_sub)

# #       address = variable_test {html_doc_sub.css(".attractions-contact-card-ContactCard__contactRow--3Ih6v").children[1].inner_html}
# #       #phone_number
# #       #phone_number = variable_test {html_doc_sub.css("a.attractions-contact-card-ContactCard__link--2pCqu").children[0].inner_html}

# #       Attraction.create!(
# #             name: "#{name}",
# #             address:"#{address}",
# #             attraction_type: "#{attraction_type}",
# #             city_id: 145)

# #       puts "Attraction #{Attraction.last.id}complete"

# #     end

# #     page_number += 30

# #   rescue

# #   is_next = false

# #   end

# # end

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

  address = variable_test {html_doc_sub.css("a._15QfMZ2L")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.r2Cf69qf").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: City.where(name:"Mexico City")[0].id
    )

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

  address = variable_test {html_doc_sub.css("a._15QfMZ2L")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.r2Cf69qf").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: City.where(name:"Paris")[0].id)

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

  address = variable_test {html_doc_sub.css("a._15QfMZ2L")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.r2Cf69qf").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: City.where(name:"Mazatlan")[0].id)

  puts "Restaurant #{Restaurant.last.id} complete"

end

puts "Adding Nassau restaurants..."

url = "http://www.tripadvisor.com/Restaurants-g147416-Nassau_New_Providence_Island_Bahamas.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._1llCuDZj").each do |listing|
  name = variable_test { listing.css("a._15_ydu6b").inner_html.gsub(/[.!\d<>-]/, '').strip}
  cuisine = variable_test {listing.css("span._1p0FLy4t")[2].inner_html}
  avg_price = variable_test {listing.css("span._1p0FLy4t")[3].inner_html }

  url_sub = "http://www.tripadvisor.com/#{listing.css("a._15_ydu6b")[0]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("a._15QfMZ2L")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.r2Cf69qf").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: City.where(name:"Nassau")[0].id
    )

  puts "Restaurant #{Restaurant.last.id} complete"

end

puts "Adding Kingston restaurants..."

url = "http://www.tripadvisor.com/Restaurants-g147310-Kingston_Kingston_Parish_Jamaica.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._1llCuDZj").each do |listing|
  name = variable_test { listing.css("a._15_ydu6b").inner_html.gsub(/[.!\d<>-]/, '').strip}
  cuisine = variable_test {listing.css("span._1p0FLy4t")[2].inner_html}
  avg_price = variable_test {listing.css("span._1p0FLy4t")[3].inner_html }

  url_sub = "http://www.tripadvisor.com/#{listing.css("a._15_ydu6b")[0]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("a._15QfMZ2L")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.r2Cf69qf").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: City.where(name:"Kingston")[0].id
    )

  puts "Restaurant #{Restaurant.last.id} complete"

end


puts "Adding La Habana restaurants..."

url = "http://www.tripadvisor.com/Restaurants-g147271-Havana_Ciudad_de_la_Habana_Province_Cuba.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("div._1llCuDZj").each do |listing|
  name = variable_test { listing.css("a._15_ydu6b").inner_html.gsub(/[.!\d<>-]/, '').strip}
  cuisine = variable_test {listing.css("span._1p0FLy4t")[2].inner_html}
  avg_price = variable_test {listing.css("span._1p0FLy4t")[3].inner_html }

  url_sub = "http://www.tripadvisor.com/#{listing.css("a._15_ydu6b")[0]["href"]}"
  html_file_sub = open(url_sub).read
  html_doc_sub = Nokogiri::HTML(html_file_sub)

  address = variable_test {html_doc_sub.css("a._15QfMZ2L")[1].inner_html.strip}
  phone_number = variable_test {html_doc_sub.css("a._3S6pHEQs")[1].inner_html.strip}
  rating = variable_test {html_doc_sub.css("span.r2Cf69qf").inner_html.gsub(/[!<>-]/, '').strip.to_f}

  Restaurant.create!(
    name: "#{name}",
    cuisine: "#{cuisine}",
    avg_price: avg_price,
    rating: rating,
    business_hours: "No data",
    address: "#{address}",
    phone_number: "#{phone_number}",
    city_id: City.where(name:"Havana")[0].id
    )

  puts "Restaurant #{Restaurant.last.id} complete"

end

puts "Creating users..."

User.create!(
      name: "David Osuna Azcona",
      email: "davidoad@gmail.com",
      password: "contrasena",
      city_id: City.where(name:"Mazatlan")[0].id,
      description: "I love travelling...especially to unknown places.",
      date_of_birth:'19/07/1990',
      phone_number: "4042633557"
      )

User.create!(
      name: "Luis César",
      email: "luiscesar@gmail.com",
      password: "contrasena",
      city_id: City.where(name:"Mexico City")[0].id,
      description: "I don't usually travelling, but when I do, I prefer Plan-et",
      date_of_birth:'20/02/1993',
      phone_number: "4047541122"
      )

User.create!(
      name: "Lou Malta",
      email: "lou@loumalta.com",
      password: "contrasena",
      city_id: City.where(name:"Paris")[0].id,
      description: "The world is my canvas and I bounce around painting.",
      date_of_birth:'10/03/1995',
      phone_number: "4047541122"
      )

User.create!(
      name: "Jose Miguel Luna",
      email: "jmlunamugica@gmail.com",
      password: "contrasena",
      city_id: City.where(name:"Beijing")[0].id,
      description: "A citizen of the world but a Mexican at heart.",
      date_of_birth:'01/08/1993',
      phone_number: "4048148904"
      )

user_photo = [
  'David_Osuna.jpeg',
  'Luis_Cesar.png',
  'Louise_Malta.png',
  'JML.jpeg'
]

User.first.photo.attach(io: File.open('app/assets/images/David_Osuna.jpeg'), filename: 'user.png', content_type: 'image/png')
User.second.photo.attach(io: File.open('app/assets/images/Luis_Cesar.png'), filename: 'user.png', content_type: 'image/png')
User.third.photo.attach(io: File.open('app/assets/images/Louise_Malta.png'), filename: 'user.png', content_type: 'image/png')
User.fourth.photo.attach(io: File.open('app/assets/images/JML.jpeg'), filename: 'user.png', content_type: 'image/png')


User.all.each do |user|
  file_path = "app/assets/images/#{user_photo[user.id - 1]}"
  user.photo.attach(io: File.open(file_path), filename: 'user.png', content_type: 'image/png')
end

puts "Creating trips..."

Trip.create!(
      name: "Magical Mazatlán Weekend at David's Estate",
      description: "Imagine if the Queen showed you around England...then multiply it by 10. David is both a Mazatlan local and a travel expert. He will take you to the beach, to a climb a cerro, eat seafood and even go dancing at night.",
      start_date: '05/05/2020',
      end_date: '10/05/2020',
      user_id: 30
      )

Trip.create!(
      name: "Parisian Paradise with Lou Malta",
      description: "There's class and then there is Paris with Lou Malta. She will take you on a tour of the river, she will show you the best and most chic spots to eat, she knows every walking tour there is and...to top it all off, she owns most art galleries in Paris so you are ready for an art treat.",
      start_date: '10/06/2020',
      end_date: '11/06/2020',
      user_id: 31
      )

Trip.create!(
      name: "Tepito Travesuras with Luis and Jose",
      description: "Do you think danger is exciting? Do you believe in la santa muerte? Folklor, street food, traditions, insecurity, this much and more with Luis and Jose in Tepito.",
      start_date: '15/07/2020',
      end_date: '15/07/2020',
      user_id: 32
      )

Trip.create!(
      name: "Xochimilco Shenanigans",
      description: "Tequila, beer and dirty water -- what can be better than this? Singing, dancing, swimming (at your own risk) and a great chance to spend time with friends.",
      start_date: '19/07/2020',
      end_date: '19/07/2020',
      user_id: 33
      )

Trip.create!(
      name: "Adventures in the Amazon",
      description: "Nature, adventure, indigenous tribes...this trip is not for the faint of heart but it will change the way you look at the mundane, concrete jungle you call a home.",
      start_date: '01/08/2020',
      end_date: '10/08/2020',
      user_id: 30
      )

Trip.create!(
      name: "Veracruz Vacations with Nacho",
      description: "It is rumored that Nacho's family invented the old man dance...must I say more? Tons of seafood, traditions, culture and history to be found here.",
      start_date: '12/10/2020',
      end_date: '15/10/2020',
      user_id: 31
      )

Trip.create!(
      name: "Thanksgiving Turkey...in Turkey!",
      description: "Literally no one celebrates Thanksgiving in Turkey, but you can! Visit mosques and then go have some bacon. Explore the bazaar only to go eat some stuffing after. No one has done it before, you're welcome.",
      start_date: '20/11/2020',
      end_date: '30/11/2020',
      user_id: 32
      )

Trip.create!(
      name: "Kickass Kenyan Kwanza",
      description: "Cultural misappropriation at its finest. Go celebrate Kwanza instead of boring old Christmas. Africa's finest safaris, wild animals, nature and lots of heat no matter what time of the year it is -- but who doesn't love a grey, hot Christmas? Kwazna...sorry.",
      start_date: '24/12/2020',
      end_date: '31/12/2020',
      user_id: 33
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

# puts "Creating meals..."

# Meal.create!(
#     name: "Breakfast at Tiffany's (also known as David's)",
#     address: "500 meters west of the paved road.",
#     restaurant_id: 1,
#     city_id: 246
#     )

# Meal.create!(
#     name: "Comida en Fonda Golosa",
#     address: "Al ladito de la Lagunilla",
#     restaurant_id: 1,
#     city_id: 140
#     )

# puts "Creating transportations..."


# Transportation.create!(
#       transportation_type: "Flight",
#       origin_city_id: 1,
#       destination_city_id: 2
#       )

# puts "Creating others..."


# Other.create!(
#       name: "A walk down the malecón where David gets whistled at.",
#       address: "Next to David's home.",
#       city_id: 246
#       )

# Other.create!(
#       name: "Sailing overnight trip with Mr. Neto Osuna.",
#       address: "On a boat",
#       city_id: 246
#       )

# Other.create!(
#       name: "Wine and bread on the river with Lou's possy.",
#       address: "River Senne",
#       city_id: 75
#       )

# Other.create!(
#       name: "Get mugged by locals",
#       address: "The heart of Tepito",
#       city_id: 140
#       )

# puts "Creating accomodations..."


# Accomodation.create!(
#     name: "Stay at CDMX",
#     address: "See hotel address",
#     hotel_id: 1,
#     city_id: 140
#     )

# puts "Creating first trip..."


# Part.create!(
#     start_date: '05/05/2020',
#     end_date: '10/05/2020',
#     name: "Get to know Mazatlán",
#     trip_id: 1,
#     city_id: 246)

# Part.create!(
#     start_date: '11/05/2020',
#     end_date: '15/05/2020',
#     name: "Explore the surrounding areas",
#     trip_id: 1,
#     city_id: 140)

# Activity.create!(
#       start_time: '05/05/2020 09:00:00',
#       end_time: '05/05/2020 11:00:00',
#       activityable_type: 'Meal',
#       activityable_id: 1,
#       part_id: 1
#       )

# Activity.create!(
#       start_time: '05/05/2020 13:00:00',
#       end_time: '05/05/2020 15:00:00',
#       activityable_type: 'Other',
#       activityable_id: 1,
#       part_id: 1
#       )

# Activity.create!(
#       start_time: '08/05/2020 08:00:00',
#       end_time: '09/05/2020 18:00:00',
#       activityable_type: 'Other',
#       activityable_id: 2,
#       part_id: 2
#       )

# puts "Creating second trip..."


# Part.create!(
#     start_date: '10/06/2020',
#     end_date: '10/06/2020',
#     name: "Travel from CDMX to Paris.",
#     trip_id: 2,
#     city_id: 75)

# Part.create!(
#     start_date: '11/06/2020',
#     end_date: '11/06/2020',
#     name: "Explore Paris, the Mexico City of Europe.",
#     trip_id: 2,
#     city_id: 75)

# Activity.create!(
#       start_time: '10/06/2020 08:00:00',
#       end_time: '10/06/2020 15:00:00',
#       activityable_type: 'Transportation',
#       activityable_id: 1,
#       part_id: 3
#       )

# Activity.create!(
#       start_time: '10/06/2020 16:00:00',
#       end_time: '10/06/2020 18:00:00',
#       activityable_type: 'Attraction',
#       activityable_id: 1,
#       part_id: 4
#       )

# Activity.create!(
#       start_time: '11/06/2020 20:00:00',
#       end_time: '11/06/2020 23:00:00',
#       activityable_type: 'Other',
#       activityable_id: 3,
#       part_id: 4
#       )

# puts "Creating third trip..."


# Part.create!(
#     start_date: '15/07/2020',
#     end_date: '15/07/2020',
#     name: "Tepito Thursday",
#     trip_id: 3,
#     city_id: 140)

# Activity.create!(
#       start_time: '15/07/2020 15:00:00',
#       end_time: '15/07/2020 17:00:00',
#       activityable_type: 'Restaurant',
#       activityable_id: 1,
#       part_id: 5
#       )

# Activity.create!(
#       start_time: '15/07/2020 17:30:00',
#       end_time: '15/07/2020 18:00:00',
#       activityable_type: 'Other',
#       activityable_id: 4,
#       part_id: 5
#       )







