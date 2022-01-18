def list_gifts(gift_list)
  gift_list.each_with_index do |gift, index|
    # gift {name:..., bought:...}
    bought = gift[:bought] ? "[x]" : "[ ]"
    puts "#{index + 1} ➡ #{bought} #{gift[:name]}"
  end
end
