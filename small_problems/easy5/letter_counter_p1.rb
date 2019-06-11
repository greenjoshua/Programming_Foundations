def word_sizes(string)
  letter_counter = {}
  words = string.split
  
  words.each do |word|
    if letter_counter.has_key?(word.length)
      letter_counter[word.length] += 1
    else
      letter_counter[word.length] = 1
    end
  end
  
  letter_counter
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}