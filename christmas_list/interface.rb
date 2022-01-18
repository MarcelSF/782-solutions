require_relative 'helpers.rb'

# 1 -> Greet the user
puts "Welcome to the Christmas List!"
# 2 -> Start the loop and display the four available options to the user (add|list|delete|quit)
action = ''
gift_list = [] # a simple array
# The gifts are now HASHES -> {bought: boolean, name: string}

until action == 'quit'
  # 3 -> Get the user Input (add/list/delete/quit) -> a string
  puts 'What would you like to do? (list/add/delete/quit)'
  # 4 -> Store the answer in a variable
  action = gets.chomp
  # 5 -> Execute the action based on the user input
  case action
  when 'add'
    # Ask the user which gift they want to add
    puts 'What would you like to add'
    # Store the input in a variable with get.chomp
    add_gift = gets.chomp
    # Push the gift to the gift_list array
    gift_list << add_gift
    # Tell the user that the gift is now in the gift list
    puts "#{add_gift} has been added to the list"
  when 'list'
    puts 'Here are your gifts'
    # Iterate over the gift list with each_with_index
    list_gifts(gift_list)
    # For each gift, we display it to the user
  when 'delete'
    puts 'Which item do you wish to delete?'
    # show the user the gifts in the gift list
    list_gifts(gift_list)
    # Ask the user which gift they wish to delete -> with the index
    # get the user index
    delete_item = gets.chomp.to_i

    unless delete_item.zero?
      puts "#{gift_list[delete_item - 1]} has been deleted"
      gift_list.delete_at(delete_item - 1)
    end
    # remove the gift from the gift_list using .delete_at(index)
    # if index == 0, do nothing
  when 'quit'
    puts "Thank you and goodbye"
  else
    puts 'Thank option is not available, please try again'
  end
end

  # If input == add, execute add action
  # elsif input == list, execute list action...
  # FOR NOW: Just do a puts 'TODO: LIST' or 'TODO: add'
# 6 -> if input is quit, say goodbye and exit the program

# 7 -> Mark a gift as bought. Add another option on the menu.
# if the user chooses to mark a gift as bought:
# -> Show the list of gifts
# -> Ask the user for the index of the gift they wish to mark as bought
# -> Display the list again, now that it has been updated
