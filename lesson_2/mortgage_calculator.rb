def valid_number?(num)
  /[[:digit:]]/.match(num)
end

def prompt(message)
  Kernel.puts (" =>#{message}")
end

loop do #main loop

  prompt("Welcome to Mortgage Calculator!")
  prompt("------------------------------")
  # user inputs loan amount and it gets converted to a float
  loan_amount = ""
  loop do
    prompt("Please enter the loan amount: ")
    loan_amount = Kernel.gets().chomp()
    break if valid_number?(loan_amount) && loan_amount.to_f > 0
    prompt("Invalid number!")
  end
  
  loan_amount = loan_amount.to_f
  
  apr = ""
  loop do
    # user inputs APR and it gets converted to a float
    prompt("Please enter the APR as a percent: ")
    apr = Kernel.gets().chomp()
    break if valid_number?(apr) && apr.to_f > 0
    prompt("Invalid number!")
  end
  
  apr = apr.to_f
  
  loan_duration = ""
  loop do
    prompt("Please enter the loan duration in months: ")
    loan_duration = Kernel.gets().chomp()
    break if valid_number?(loan_duration) && loan_duration.to_f > 0
    prompt"Invalid number!"
  end
  
  loan_duration = loan_duration.to_f
  
  annual_interest_rate = apr / 100
  monthly_interest_rate = annual_interest_rate / 12
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** (-loan_duration)))
  
  
  prompt("Your monthly payment amount is $#{Kernel.format('%02.2f', monthly_payment)}")
  
  prompt("Do you want to do another calculation?")
  answer = Kernel.gets().chomp()
  
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
