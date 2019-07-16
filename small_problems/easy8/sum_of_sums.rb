def sum_of_sums(numbers)
  products = []
  counter = 1
  
  loop do
    break if counter > numbers.size
    number = numbers[0, counter]
    number = number.reduce(:+)
    products << number
    counter += 1
  end
  
  products.reduce(:+)
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35