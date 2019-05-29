#==> Enter the last number:
#17
#The number 17 appears in [25, 15, 20, 17, 23].

puts "Enter the 1st number:"
num1 = gets.chomp.to_i

puts "Enter the 2nd number:"
num2 = gets.chomp.to_i

puts "Enter the 3rd number:"
num3 = gets.chomp.to_i

puts "Enter the 4th number:"
num4 = gets.chomp.to_i

puts "Enter the 5th number:"
num5 = gets.chomp.to_i

puts "Enter the last number:"
last_num = gets.chomp.to_i

arr = [num1, num2, num3, num4, num5]

if arr.include?(last_num)
  puts "The number #{last_num} appears in #{arr}."
else
  puts "The number #{last_num} does not appear in #{arr}."
end
