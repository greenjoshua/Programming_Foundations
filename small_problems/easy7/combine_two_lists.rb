def interleave(arr1, arr2)
  new_arr = []
  counter = 0

  until counter >= arr1.size
    new_arr << arr1[counter]
    new_arr << arr2[counter]
    counter += 1
  end

  new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
