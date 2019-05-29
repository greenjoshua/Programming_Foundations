=begin
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

year = Time.now.year

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

years_to_retire = retire_age - age
retire_year = year + years_to_retire

puts "It's #{year}. You will retire in #{retire_year}."
puts "You have only #{years_to_retire} years of work to go!"
