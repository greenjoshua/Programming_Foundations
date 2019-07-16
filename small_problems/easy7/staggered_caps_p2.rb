def staggered_case(str)
  counter = 0
  result = ""
  
  str.chars.each do |char|
    if char =~ /[a-z]/i
      if counter.even?
        result << char.upcase
      else
        result << char.downcase
      end
      
      counter += 1
    else
      result << char
    end
  end
  
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'