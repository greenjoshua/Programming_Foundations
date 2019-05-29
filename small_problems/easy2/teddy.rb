age = rand(20..200)

puts "Enter a name: "

name = gets.chomp

if name == ''
  name = "Teddy"
end

puts "#{name} is #{age} yeas old!"