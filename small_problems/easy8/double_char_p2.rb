def double_consonants(str)
  consonants = %w(b c d f g h j k l m n p q r s t v w x y z)
  double_str = []
  
  str.each_char do |char|
    if consonants.include?(char.downcase)
      double_str << char * 2 
    else
      double_str << char 
    end
  end
  
  double_str.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""