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

def signed_string_to_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then  string_to_integer(string[1..-1])
  else           string_to_integer(string)
  end
end

p signed_string_to_integer('4321') == 4321
p signed_string_to_integer('-570') == -570
p signed_string_to_integer('+100') == 100