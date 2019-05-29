puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
percentage = gets.chomp.to_f
percentage /= 100

tip = bill * percentage
total = bill + tip

puts "The tip is $#{format("%.2f",tip)}"
puts "The total $#{format("%.2f",total)}"
