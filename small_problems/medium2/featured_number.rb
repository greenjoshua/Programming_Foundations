require 'pry'
require 'pry-byebug'

def featured(number)
  featured_number = number
  
  until featured_number % 7 == 0
    featured_number += 1
  end
  
  loop do
    featured_str = featured_number.to_s.split("")
    break if (featured_number > number) && featured_number.odd? && 
           featured_str.all? { |num| featured_str.count(num) == 1 }
    featured_number += 7
    
    if number >= 9_876_543_210
      featured_number = "There is no possible number that fulfills those requirements"
      break
    end
    #binding.pry
  end
  
  featured_number
end




p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)