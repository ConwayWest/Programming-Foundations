# car_loan.rb

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to the Mortgage/Car Loan Calculator!")
prompt("What is your name?")
name = gets.chomp
prompt("Hello #{name}!")

loop do
  prompt("What is your loan amount?")

  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if loan_amount.empty?() || loan_amount.to_f < 0
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  prompt("What is your APR? (Annual Percentage Rate)")
  prompt("EX: (Enter 5% as '5')")

  apr = ''
  loop do
    apr = gets.chomp
    if apr.empty?() || apr.to_f < 0
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  prompt("Loan duration? (in months)")

  loan_duration = ''
  loop do
    loan_duration = gets.chomp
    if loan_duration.empty? || loan_duration.to_i < 0
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  mpr = (apr.to_f * 0.01) / 12
  loan_payments = loan_amount.to_f * (mpr * (1 + mpr)**loan_duration.to_f) / ((1 + mpr)**loan_duration.to_f - 1)
  loan_payments = loan_payments.round(2)

  prompt("#{name}, your monthly payments for a loan amount of $#{loan_amount} with an APR of #{apr}% over #{loan_duration.to_f / 12} years is: $#{loan_payments}")
  prompt("Calculate another loan payment? (Enter 'Y' for yes")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you #{name} for using the Mortgage/Car Loan Calculator!")
prompt("Goodbye!")
