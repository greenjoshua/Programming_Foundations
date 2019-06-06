  DIGITS = { 0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4",
             5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }

def integer_to_string(int)
  str = ''
  
  int *= -1 if (int <=> 0) == -1
  
  numbers = int.digits.reverse
  
  numbers.each { |num| str << DIGITS[num] }
  
  str
end

def signed_integer_to_string(number)
  case number <=> 0
  when +1 then "+#{integer_to_string(number)}"
  when -1 then "-#{integer_to_string(number)}"
  else         "#{integer_to_string(number)}"
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'