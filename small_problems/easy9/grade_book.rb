def get_grade(num1, num2, num3)
  mean = (num1 + num2 + num3) / 3
  score = nil
  
  if mean >= 90 && mean <= 100
    score = "A"
  elsif mean >= 80 && mean < 90
    score = "B"
  elsif mean >= 70 && mean < 80
    score = "C"
  elsif mean >= 60 && mean < 70
    score = "D"
  else
    score = "F"
  end
  
  score
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
