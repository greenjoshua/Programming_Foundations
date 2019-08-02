def buy_fruit(arr)
  fruits = []
  arr.each do |sub|
    count = sub[1].to_i
    count.times { fruits << sub[0] }
  end
  fruits
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]