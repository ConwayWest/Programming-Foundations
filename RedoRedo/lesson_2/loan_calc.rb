require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

prompt("Welcome to the Loan Calculator!")
prompt("What is your name?")
name = gets.chomp
prompt("Hello #{name}!")

loop do # main loop
  loan_amount = ''
  loop do
    prompt("What is the loan amount?")
    loan_amount = gets.chomp

    if number?(loan_amount)
      break
    else
      prompt("Invalid number. Please try again.")
    end
  end

  apr = ''
  loop do
    prompt("What is the APR (Annual Percentage Rate) of the loan? (4.5% = 4.5 please")
    apr = gets.chomp

    if number?(apr)
      break
    else
      prompt("Invalid number. Please try again.")
    end
  end

  loan_duration = ''
  loop do
    prompt("What is the duration of the loan? (in months)")
    loan_duration = gets.chomp

    if number?(loan_duration)
      break
    else
      prompt("Invalid number. Please try again.")
    end
  end
  monthly_apr = (apr.to_f * 0.01) / 12

  monthly_payment = loan_amount.to_f*(monthly_apr*(1+monthly_apr)**loan_duration.to_i)/((1+monthly_apr)**loan_duration.to_i-1)

  prompt("Your monthly payment for a $#{loan_amount.to_f.round(2)} loan with an APR of #{apr}%K over #{loan_duration.to_i} months is: $#{monthly_payment.round(2)}")

  prompt("Would you like to perform another loan calculation?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Loan Calculator!")
