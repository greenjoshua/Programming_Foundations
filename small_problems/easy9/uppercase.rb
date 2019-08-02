def uppercase?(str)
  str = str.chars
  lowercase = str.any?(/[a-z]/)
  if lowercase
    return false
  else
    return true
  end
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
