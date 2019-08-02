def rotate_array(arr, index)
  newarr = arr.map do |elem|
    next if elem == arr[-index]
    elem
  end
  newarr << arr[-index]
end

def rotate_rightmost_digits(number, rotate_index)
  arr = rotate_array(number.to_s.chars, rotate_index)
  arr.delete_if { |elem| elem == nil }
  arr.join.to_i
end

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end


p max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(35) #== 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845