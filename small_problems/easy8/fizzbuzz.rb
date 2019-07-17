def fizzbuzz(start_num, end_num)
  fizzbuzz = []
  
  start_num.upto(end_num) do |num|
    if (num % 3 == 0) && (num % 5 == 0)
      fizzbuzz << "FizzBuzz"
    elsif num % 3 == 0
      fizzbuzz << "Fizz"
    elsif num % 5 == 0
      fizzbuzz << "Buzz"
    else
      fizzbuzz << num.to_s
    end
  end
  
  puts "#{fizzbuzz.join(", ")}"
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
