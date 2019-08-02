def sum_square_difference(number)
  sum = 0
  squares = []
  
  1.upto(number) do |num|
    sum += num
  end
  
  1.upto(number) do |num|
    squares << num**2
  end
  
  sum = sum**2
  sum - squares.reduce(:+)
end





p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150