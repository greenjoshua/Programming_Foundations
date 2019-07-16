def multiply_list(arr1, arr2)
  counter = 0
  multiplied_numbers = []
  
  loop do
    break if counter >= arr1.size
    element = arr1[counter] * arr2[counter]
    multiplied_numbers << element
    counter += 1
  end
  
  multiplied_numbers
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
