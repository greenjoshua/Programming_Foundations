def swapcase(str)
  new_str = ""
  counter = 0
  upcased = %(ABCDEFGHIJKLMNOPQRSTUVWXYZ)
  downcased = %(abcdefghijklmnopqrstuvwxyz)
  characters = str.chars
  
  loop do
    letter = characters[counter]
    
    if upcased.include?(letter)
      new_str << letter.downcase
    elsif downcased.include?(letter)
      new_str << letter.upcase
    else
      new_str << letter
    end
    
    counter += 1
    break if counter == characters.size
  end
  new_str
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'