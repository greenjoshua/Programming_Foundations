def merge(arr1, arr2)
  combined_arr = []
  
  arr1.each { |elem| combined_arr << elem if !combined_arr.include?(elem) }
  arr2.each { |elem| combined_arr << elem if !combined_arr.include?(elem) }
  
  combined_arr
end


p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]