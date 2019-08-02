def neutralize(sentence)
  words = sentence.split(' ')
  delete_words = []
  counter = 0
  
  words.each do |word|
    delete_words << word if negative?(word)
    counter += 1 if negative?(word)
  end
  
  counter.times do |word|
    words.each do |delete_word|
      words.delete(delete_words[counter - 1])
    end
    counter -= 1
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.