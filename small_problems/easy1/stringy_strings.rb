def stringy(num)
  create_string = []

  counter = 0

  while counter <= num
    counter += 1

    break if counter > num

    str = counter.odd? ? '1' : '0'
    
    create_string << str
  end

create_string = create_string.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
