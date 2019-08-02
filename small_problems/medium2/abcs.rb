def block_word?(word)
  block1 = %(BXDCNGRFJHVLZ).split("")
  block2 = %(OKQPATESWUIYM).split("")
  letters = []
  indexes = []
  
  block1.each_with_index do |letter, index|
    if word.upcase.include?(letter.upcase)
      letters << letter.upcase
      indexes << index
    end
  end
  
  word.chars.each_with_index do |letter, index|
    b1_index = block2.index(letter.upcase) if block2.include?(letter.upcase)
    if block2.include?(letter.upcase) && !indexes.include?(b1_index)
      letters << letter.upcase
    end
  end
   
  result = true
  word.split("").each { |char| result = false if !letters.include?(char.upcase) }
  
  result
end



p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true