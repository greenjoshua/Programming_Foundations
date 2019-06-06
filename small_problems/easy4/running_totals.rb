def running_total(arr)
  total = []
  counter = 0
  sum = 0

  while counter < arr.size
    sum += arr[counter]
    total << sum
    counter += 1
  end

  total
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
