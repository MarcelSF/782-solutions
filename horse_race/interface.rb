# 1 -> Greet the user to the horse race!
puts "Welcome to the horse race! Good luck and have fun!"
# 2 -> Show the racing horses to the user.
    # Horses? Array of strings (the name of each horse).
horses = ['Ruby', 'Black Beauty', 'Sea Biscuit', 'Roach', 'Flower Power']
answer = 'y'
balance = 100

while answer == 'y' && balance >= 20
  puts "These are the available horses 🐎"
  horses.each_with_index do |horse, index|
    puts "#{index + 1} -> #{horse}"
  end
  # 3 -> Ask the user on which horse they would like to bet on
  puts "Please guess the winner"
  user_index = gets.chomp.to_i
  user_horse = horses[user_index - 1]
  # 4 -> Determine who is the winning horse
  winner = horses.sample
  puts "You chose #{user_horse}. The winner is #{winner}"
  # 5 -> If the user chose the winning horse, they win and add money to the User Balance
  if winner == user_horse
    puts "Congratulations, you won!"
    balance += 50
  else
    # 6 -> If they lost, we tell them and say 'Sorry you lost' and deduct money from the User Balance.
    puts "Sorry, you lost!"
    balance -= 70
  end

  puts "Your current balance is #{balance} euros"

  if balance >= 20
    # 7 -> Ask the user if they want to play again.
    # 8 -> If they say yes AND they have enough money -> Go back to step #2
    puts "Would you like to bet once more? (y/n)"
    answer = gets.chomp
  else
    puts "You don't have enough funds, please come back another day"
    answer = ''
  end
end

# 9 -> If they say no OR they don't have enough money -> Exit the loop and the program.
puts "Thank you for playing the amazing 782 Horse Race! 🐴"
