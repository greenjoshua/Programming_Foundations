def is_odd?(num)
  num = num.abs
  
  if num == 0
    false
  elsif num % 2 == 0
    false
  else
    true
  end
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true