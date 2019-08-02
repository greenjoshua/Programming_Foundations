def fibonacci(nth)
  return if (nth == 1) || (nth == 2)
  nth_return = 1
  previous_nth = 1
  next_value = 1
  
  (nth - 1).times do |number|
    previous_nth = nth_return
    nth_return = next_value
    next_value = previous_nth + nth_return
  end
  
  nth_return
end



p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501