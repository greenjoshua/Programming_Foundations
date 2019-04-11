# calculator => refractored
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to the calculator! Enter your name: ") # asks for 2 numbers and assigns them to the variable num1 and num2

name = ''
loop do
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt("Make sure you use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}")

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
  
  num2 = ''
  loop do
    prompt("Please enter the second number: ")
    num2 = Kernel.gets().chomp()
    
    if valid_number?(num2)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end
  
  operator_prompt = <<-MSG # asks which operation to tell the calculator to perform
  What operation would you like to perform?
  1) add
  2) subtract
  3) multipy
  4) divide
  MSG
  
   # asks which operation to tell the calculator to perform
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end
  
  prompt("#{operation_to_message(operator)} the two numbers...")
  
  result = case operator
          when '1'
            num1.to_i + num2.to_i
          when '2'
            num1.to_i - num2.to_i
          when '3'
            num1.to_i * num2.to_i
          when '4'
            num1.to_f / num2.to_f
  
  end
  
  prompt("The result is #{result}")
  
  prompt("Do you want to perform another calculation? ('Y' to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt ("Thank you for using the calculator. Good bye!")