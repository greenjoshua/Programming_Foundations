def substrings_at_start(str)
  substrings = []
  counter = 1
  
  loop do
    break if counter > str.chars.size
    character = str[0, counter]
    substrings << character
    counter += 1
  end
  
  substrings.sort
end

def substrings(str)
  strings = []
  str = str.chars
  loop do
    break if str.size == 0
    str = str.join
    strings << substrings_at_start(str)
    str = str.chars
    str.shift
  end
  
  strings.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]