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

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']