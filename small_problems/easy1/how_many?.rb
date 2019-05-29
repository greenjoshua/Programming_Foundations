def count_occurences(list)
  ocurrences = {}
  val = list.uniq
  count = 0

  while count < val.size
    element = val[count]
    ocurrences[element] = list.count(element)
    count += 1
  end
  ocurrences
end

vehicles = [ 'car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

puts count_occurences(vehicles)