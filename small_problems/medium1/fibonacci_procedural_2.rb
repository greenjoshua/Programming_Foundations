def fibonacci_last(nth)
  return if (nth == 1) || (nth == 2)
  nth_return = 1
  previous_nth = 1
  next_value = 1
  
  (nth - 1).times do |number|
    previous_nth = nth_return
    nth_return = next_value
    next_value = previous_nth + nth_return
  end
  
  nth_return.to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
