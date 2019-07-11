def include?(arr, value)
  rval = false
  
  arr.each { |val| rval = true if val == value }
  
  rval
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false