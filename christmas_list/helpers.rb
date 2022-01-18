require 'open-uri'
require 'nokogiri'

puts "What are you searching on Etsy?"
article = gets.chomp

# 1. We get the HTML page content thanks to open-uri
html_content = URI.open("https://www.etsy.com/search?q=#{article}").read
# 2. We build a Nokogiri document from this file
doc = Nokogiri::HTML(html_content)

# 3. We search for the correct elements containing the items' title in our HTML doc
doc.search('.v2-listing-card .v2-listing-card__info .v2-listing-card__title').first(5).each do |element|
  # 4. For each item found, we extract its title and print it
  name = element.text.strip # returns to us a string ->
  gift = {name: name, bought: false}
end

def list_gifts(gift_list)
  gift_list.each_with_index do |gift, index|
    # gift {name:..., bought:...}
    bought = gift[:bought] ? "[x]" : "[ ]"
    puts "#{index + 1} ➡ #{bought} #{gift[:name]}"
  end
end
