arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p arr.flatten

new_arr = arr.map do |sub_array|
  sub_array.select do |num|
    num % 3 == 0
  end
end

p new_arr