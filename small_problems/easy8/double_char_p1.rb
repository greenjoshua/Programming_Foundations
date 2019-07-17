def repeater(str)
  doubled_str = []

  str.each_char { |let| doubled_str << let * 2 }
  
  doubled_str.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''