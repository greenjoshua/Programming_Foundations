def show_multiplicative_average(numbers)
  count_of_numbers = numbers.size
  multiplied_numbers = numbers.reduce(:*).to_f
  result = multiplied_numbers / count_of_numbers
  puts "The result is #{format("%.3f", result)}"
end


show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
