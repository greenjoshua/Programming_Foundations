def multisum(num)
  numbers = Array(1..num).keep_if { |number| number % 3 == 0 || number % 5 == 0 }
  numbers.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
