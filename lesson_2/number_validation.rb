# make a method that validates integers and floats
#require 'pry'

def valid_number?(number)
  number.to_f.to_s == number
end
#binding.pry

number = ''
loop do
  puts("Enter a number: ")
  number = gets.chomp.to_i
  if valid_number?(number)
    break
  else
    puts "That is not a valid number."
  end
end