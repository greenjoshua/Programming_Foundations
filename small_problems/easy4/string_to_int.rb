def string_to_integer(int)
  numbers = []
  digits = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
             "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }
  
  int.split('').each do |num|
    numbers << digits[num]
  end

  value = 0
  numbers.each { |number| value = 10 * value + number }
  value
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
