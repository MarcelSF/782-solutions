def list_gifts(gift_list)
  gift_list.each_with_index do |gift, index|
    puts "#{index + 1} ➡ #{gift}"
  end
end
