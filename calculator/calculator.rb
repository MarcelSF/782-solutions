def calculate(number_one, number_two, operator)
  if operator == '+'
    number_one + number_two
  elsif operator == '-'
    number_one - number_two
  elsif operator == '*'
    number_one * number_two
  elsif operator == '/'
    number_one / number_two
  else
    "That isn't valid, try again."
  end
end

