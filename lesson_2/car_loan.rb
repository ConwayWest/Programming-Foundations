def prompt(message)
  puts("=> #{message}")
end

loop do
  prompt("Welcome to Kyle's Car/Mortgage Loan Calculator!")
  prompt("")
  prompt("To start, we will need a few bits of information!")
  prompt("\n\n")
  prompt("Loan Amount: ")

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if loan_amount.empty?() || loan_amount.to_f < 0
      prompt("Must enter valid number.")
    else
      break
    end
  end

  prompt("APR (whole numbers please): ")

  apr = ''
  loop do
    apr = gets.chomp

    if apr.empty?() || apr.to_f < 0
      prompt("Must enter valid number.")
    else
      break
    end
  end

  prompt("Loan Duration (in months): ")

  loan_duration = ''
  loop do
    loan_duration = gets.chomp

    if loan_duration.empty?() || loan_duration.to_i < 0
      prompt("Must enter valid number.")
    else
      break
    end
  end

  apr_month = apr.to_f / 100 / 12

  monthly_pay = loan_amount.to_f * (apr_month * (1 + apr_month)**loan_duration.to_i) / ((1 + apr_month)**loan_duration.to_i - 1)

  prompt("Your monthly pay for a loan of $#{loan_amount} over #{loan_duration} months is $#{monthly_pay.round(2)}.")
  prompt("\n\n")
  prompt("Another calculation? (Y or N)")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Kyle's Car/Mortgage Loan Calculator!")
prompt("Farewell!")
