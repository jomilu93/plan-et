require 'json'
require "open-uri"
require 'restcountry'
require 'nokogiri'

puts "Testing Mexico Restaurants"

def variable_test
  begin
    yield
  rescue
    "No data"
  end
end

# url = "http://www.tripadvisor.com/Hotels-g150800-Mexico_City_Central_Mexico_and_Gulf_Coast-Hotels.html"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.css("div.listing.collapsed").each do |listing|

#   url_sub = "http://www.tripadvisor.com/#{listing.children[0]["data-url"]}"
#   html_file_sub = open(url_sub).read
#   html_doc_sub = Nokogiri::HTML(html_file_sub)

#   name = variable_test {listing.css(".listing_title a").text}
#   address = variable_test {html_doc_sub.css("span._3ErVArsu.jke2_wbp")[0].inner_html}
#   phone_number = variable_test{html_doc_sub.css("span._1_CU9UZ6._3ErVArsu.jke2_wbp")[0].inner_html}
#   rating = variable_test{listing.css("span._3cjYfwwQ").inner_html.to_f}

#   p address
#   p phone_number
#   p rating

# end

puts "Testing Kingston attractions..."

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

  p name
  p attraction_type
  p address

end
