def compute_sum(num)
  (1..num).reduce(:+)
end

def compute_product(num)
  (1..num).reduce(:*)
end

def valid_number?(num)
  num > 0 && num.to_s.match?(/[[:digit:]]/)
end

int = 0
total = 0
operator = ''
operator_type = ''

loop do
  loop do
    puts "Please enter an integer greater than 0: "
    int = gets.chomp.to_i
    break if valid_number?(int)
    puts "Please input a valid integer."
  end

  loop do
    puts "Enter 's' to compute the sum, 'p' to compute the product."
    operator = gets.chomp
    break if operator == 's' || operator == 'p'
    puts "That is not a valid operator."
  end

  if operator == 's'
    total = compute_sum(int)
    operator_type = "sum"
  elsif operator == 'p'
    total = compute_product(int)
    operator_type = "product"
  end

  break if total
end

puts "The #{operator_type} of the integers between 1 and #{int} is #{total}."
