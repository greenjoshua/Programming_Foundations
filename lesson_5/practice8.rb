hsh = {first: ['the', 'quick'],
      second: ['brown', 'fox'],
      third: ['jumped'],
      fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.each do |words|
  vowels = ['a', 'e', 'i', 'o', 'u']
  words.each do |word|
    letter_arr = word.chars
    letter_arr.each do |letter|
      if vowels.include?(letter)
        p letter
      end
    end
  end
end
