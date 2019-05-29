def sum(num)
  numbers = num.to_s.split('')

  numbers.reduce {|sum, number| sum.to_i + number.to_i}
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45