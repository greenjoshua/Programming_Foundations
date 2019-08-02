DIGITS = { "zero" => "0", "one" => "1", "two" => "2", "three" => "3", "four" => "4",
           "five" => "5", "six" => "6", "seven" => "7", "eight" => "8",
           "nine" => "9"
}

def word_to_digit(str)
  new_str = []
  replace = ""
  digits = DIGITS.keys

  
  str.split.each do |val|
    split_val = ""
    save_key = ""
    
    digits.each do |key, value|
      split_val = val.partition(key)
      replace = split_val[1]
      
      if digits.include?(replace)
        save_key = key
        new_str << val.gsub(replace, DIGITS[replace])
      end
    end
    
    new_str << val if !digits.include?(save_key)
  end
  
  new_str.join(" ")
end



p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

