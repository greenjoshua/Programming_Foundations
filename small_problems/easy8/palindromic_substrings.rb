require "pry"
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

def palindromes(str)
  p_dromes = []
  sub_strings = substrings(str)
  sub_strings.each { |word| p_dromes << word unless (word != word.reverse) ||
  word.size < 2}
  
  p_dromes
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
