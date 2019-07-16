def penultimate(str)
  str = str.split(" ")
  str[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'