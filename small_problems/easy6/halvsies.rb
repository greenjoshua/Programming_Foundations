def halvsies(arr)
  counter = 1
  slice1 = []
  slice2 = []
  half = (arr.count + 1) / 2 if arr.count.odd?
  half = arr.count / 2 if arr.count.even?

  arr.each do |elem|
    if counter <= half
      slice1 << elem
    else
      slice2 << elem
    end
    counter += 1
  end

  [slice1, slice2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]