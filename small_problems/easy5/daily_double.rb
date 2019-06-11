def crunch(str)
  new_str = ''
  counter = 0

  while counter <= str.length - 1
    new_str << str[counter] unless str[counter] == str[counter + 1]
    counter += 1
  end

  new_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
