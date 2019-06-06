def swap(words)
  new_words = []
  words = words.split
  
  words.each do |word|
    last_index = word.length - 1
    last_element = word[last_index]
    word[last_index] = word[0]
    word[0] = last_element
    new_words << word
  end

  new_words.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

