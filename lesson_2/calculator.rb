# calculator => refractored

require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  /[[:digit:]]/.match(num)
end

def operation_to_message(op)
  operator = case op
             when '1'
               'Adding'
             when '2'
               'Subtracting'
             when '3'
               'Multiplying'
             when '4'
               'Dividing'
             end
             
  operator
  
end

prompt(MESSAGES['welcome']) # asks for 2 numbers and assigns them to the variable num1 and num2

name = ''
loop do
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt(MESSAGES['valid_number'])
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  num1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    num1 = Kernel.gets().chomp() # cut all whitespace and convert string to integer using the to_i method
    
    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['wrong_number1'])
    end
  end
  
  num2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    num2 = Kernel.gets().chomp()
    
    if valid_number?(num2)
      break
    else
      prompt(MESSAGES['wrong_number2'])
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
      prompt(MESSAGES['choose_num'])
    end
  end
  
  prompt("#{operation_to_message(operator)} #{MESSAGES['operator_message']}")
  
  result = case operator
          when '1'
            num1.to_f + num2.to_f
          when '2'
            num1.to_f - num2.to_f
          when '3'
            num1.to_f * num2.to_f
          when '4'
            num1.to_f / num2.to_f
  
  end
  
  prompt("#{MESSAGES['result1']} #{result}")
  
  prompt(MESSAGES['calculate'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])