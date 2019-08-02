def diamond(number)
  counter = (number - 1) / 2
  reverse_counter = 1
  
  until counter <= 0
    puts " "*counter + "*"*reverse_counter + " "*counter
    counter -= 1
    reverse_counter += 2
  end
  
  until counter > (number - 1) / 2
    puts " "*counter + "*"*reverse_counter + " "*counter
    counter += 1
    reverse_counter -= 2
  end
end

diamond(1)
diamond(3)
diamond(9)