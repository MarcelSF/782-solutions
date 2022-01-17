# cart -> Array of symbols
# 1 -> Greet the user
# 2 -> List the items that are available in the store
# The store should be a hash: {kiwi: 1, apple: 2}...
# Use .each method to iterate over the key/value pairs and display the store to the user
# 3 -> Ask the user what they want to buy -> Ask the user to type out what they want (kiwi, apple, etc)
# 4 -> Check to see if the desired item is available in the store
# 5 -> If it is available: Add the item to the cart
# cart = [] ... cart << 'apple'
# cart -> ['apple', 'banana', 'kiwi', 'apple']
# 6 -> If not, ask the user for a different item
# 7 when the user types quit -> Calculate the total sum owed/ the bill
# item -> hash
# item[:name], or , item[:quantity]
# we need to access the hash to get the information.
# call the hash and give it the key -> it will return to us the value
  # 8 -> Show the bill to the user

require 'pry-byebug' # use binding.pry to pause the program and load into IRB

puts "Welcome to the 782 store"
store = {apple: {price: 1, stock: 6}, pizza: {price: 5, stock: 6}, beer: {price: 1, stock: 20}}
cart = []
purchase = ''

until purchase == :quit

  store.each do |food, info|
    # info -> {price: 1, stock: 6}
    puts "> #{food} - #{info[:price]} euro(s). #{info[:stock]} available"
  end
  puts "Which item would you like to buy? Type 'quit' to exit and pay the bill 💶"
  purchase = gets.chomp.to_sym
  if store.key?(purchase)
    puts "How many #{purchase}s would you like to buy?"
    quantity = gets.chomp.to_i
    # Check the available stock!
    if quantity <= store[purchase][:stock]
      cart << {name: purchase, quantity: quantity}
      store[purchase][:stock] -= quantity
      puts "Your item was added to the shopping basket"
    else
      puts "Sorry, we only have #{store[purchase][:stock]} #{purchase}s in stock"
    end
  elsif purchase == :quit
    puts "Thank you, here is the bill"
  else
    puts "Sorry, that is not available right now. Please choose another item."
  end
end

total = 0
cart.each do |item|
  price = store[item[:name]][:price]
  puts "#{item[:name]} x #{item[:quantity]} -> price: #{price * item[:quantity]} euros"
  total += price * item[:quantity]
end
puts

puts "The total amount owed is #{total} euros"

