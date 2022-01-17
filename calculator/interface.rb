require_relative 'calculator.rb'
# 1 -> Greet the user
# 2 -> Ask the user for the first number -> Get the user's answer -> store it in a variable
# 3 -> Ask the user for the second number -> Get the user's answer -> store it in a variable
# 4 -> Ask the user for the mathematical operator -> Also store it in a variable
# 5 -> Get the calculation done based on the operator.
# 6 -> Show the result of the calculation to the User
# 7 -> Ask the user if they want to calculate again
# 8 -> If yes, return to step #2
# 9 -> If no, exit the program.

puts "Hello there! It's math time!"
answer = 'y'
while answer == 'y'
  puts "Please enter the first number"
  number_one = gets.chomp.to_i

  puts "Please enter the second number"
  number_two = gets.chomp.to_i

  puts "Which operation do you wish to perform [+|-|*|/]"
  operator = gets.chomp

  result = calculate(number_one, number_two, operator)

  puts "The result is: #{result}"

  puts "Would you like to calculate again? (y/n)"
  answer = gets.chomp
end

puts "Thank you and goodbye!"
