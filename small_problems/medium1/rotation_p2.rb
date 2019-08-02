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


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917