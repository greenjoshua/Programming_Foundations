words = "the flintstones rock"

words = words.split('').each {|letter| letter.upcase! }.join

p words