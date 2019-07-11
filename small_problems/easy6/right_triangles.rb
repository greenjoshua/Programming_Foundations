def triangle(num)
  str = ""
  (num - 1).times { |_| str << " " }
  num.times {|*| str << "*" }
  counter = 1
  
  num.times do |_|
    puts "#{str[0, (num - counter)]}#{str[(num - 1), counter]}"
    counter += 1
  end
end

triangle(5)
triangle(9)