#Write a method that takes a year as input and returns the century. The 
#return value should be a string that begins with the century number, and ends 
#with st, nd, rd, or th as appropriate for that number.
#New centuries begin in years that end with 01. 
#So, the years 1901-2000 comprise the 20th century.
=begin
input: a year, integer
output: century number followed by st, nd, rd, or th as a string
rules: new centuries begin in years that end with 01
algorithm:
START
  Given a year as an integer
  century = (year / 100) + 1
  century -= 1 if year % 100
  
  don't have to round
  round the century down to the number
  century.round(half: :down)
  century.to_s + century_suffix(century)
END

START
  Given a century
  last_digits = century.split('')
  last_digits = last_digits[-1]
  return 'th' if [11, 12, 13].include?(last_digits[-2, 2])
  case last_digits
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'


=end

def century(year)
  century = (year / 100) + 1
  century -= 1 if year % 100 == 0
  
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10
  
  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

