require 'open-uri'
require 'nokogiri'

def idea
  puts "What are you searching on Etsy?"
  article = gets.chomp

  # 1. We get the HTML page content thanks to open-uri
  html_content = URI.open("https://www.etsy.com/search?q=#{article}").read
  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(html_content)
  etsy_list = []
  # 3. We search for the correct elements containing the items' title in our HTML doc
  doc.search('.v2-listing-card .v2-listing-card__info').first(5).each do |element|
    # 4. For each item found, we extract its title and print it
    name = element.search('.v2-listing-card__title').text.strip
    price = element.search('.currency-value').text.strip
    # Method strip will remove trailing blank spaces
    etsy_list << {name: name, bought: false, price: price.to_f}
  end
  etsy_list
end

def list_gifts(gift_list)
  gift_list.each_with_index do |gift, index|
    # gift {name:..., bought:...}
    bought = gift[:bought] ? "[x]" : "[ ]"
    puts "#{index + 1} ➡ #{bought} #{gift[:name]}"
    # in Ruby, everything is TRUE EXCEPT False and NIL
    puts "Price: #{gift[:price]}" if gift[:price]
  end
end

