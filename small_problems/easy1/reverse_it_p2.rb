require 'pry'
require 'pry-byebug'

def reverse_words(words)
  if words.split.size == 1
    binding.pry
    if words.size >= 5
      words = words.reverse
    else
      words
    end
  else
    new_sentence = words.split.map do |word|
      if word.size >= 5
        word.reverse
      else
        word
      end
    end
    
    new_sentence.join(' ')
  end
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS