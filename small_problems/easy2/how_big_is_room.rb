SQ_METERS_TO_SQ_FEET = 10.7639

puts "Enter the length of the room in meters: "
length = gets.chomp.to_f

puts "Enter the width of the room in meters: "
width = gets.chomp.to_f

sq_m = length * width
sq_f = sq_m * SQ_METERS_TO_SQ_FEET 

puts "The area of the room is #{sq_m} square meters (#{sq_f} square feet)."
