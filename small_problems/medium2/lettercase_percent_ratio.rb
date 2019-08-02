def letter_percentages(str)
  ratios = {}
  
  upper_count = str.count("A-Z")
  upper_percent = (upper_count.to_f / str.size) * 100
  lower_count = str.count("a-z")
  lower_percent = (lower_count.to_f / str.size) * 100
  neither_count = str.count(" -~", "^A-Za-z")
  neither_percent = (neither_count.to_f / str.size) * 100
  
  ratios[:lowercase] = lower_percent.to_f
  ratios[:uppercase] = upper_percent.to_f
  ratios[:neither] = neither_percent.to_f
  
  ratios
end






p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }