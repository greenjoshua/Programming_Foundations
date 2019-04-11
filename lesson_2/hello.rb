# Kernel.puts("hello world")

def valid_number?(num)
  num.to_i.to_s == num
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do # main loop
  num1 = ''
  loop do
    prompt("Please enter the first number: ")
    num1 = Kernel.gets().chomp() # cut all whitespace and convert string to integer using the to_i method
    
    if valid_number?(num1)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end
  puts "Good job"
end

