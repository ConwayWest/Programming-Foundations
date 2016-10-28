def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(number)
  integer?(number) || float?(number)
end

prompt("Wecome to the Mortgage Calculator!")
prompt("----------------------------------")

loop do
  # Inputs
  loan_amount = ''
  loop do
    prompt("What is the amount of the loan?")
    print("$")
    loan_amount = gets().chomp()

    if number?(loan_amount) && !loan_amount.empty?
      break
    else
      prompt("INVALID NUMBER! PLEASE TRY AGAIN")
    end
  end

  annual_interest = ''
  loop do
    prompt("What is the APR of the loan?")
    print("%")
    annual_interest = Kernel.gets().chomp()

    if number?(annual_interest) && !annual_interest.empty?
      break
    else
      prompt("INVALID NUMBER! PLEASE TRY AGAIN")
    end
  end

  loan_years_duration = ''
  loop do
    prompt("What is the loan duration in years? (Can use decimals)")
    print("Years: ")
    loan_years_duration = Kernel.gets().chomp()

    if number?(loan_years_duration) && !loan_years_duration.empty?
      break
    else
      prompt("INVALID NUMBER! PLEASE TRY AGAIN")
    end
  end
  prompt("----------------------------------")

  # Calculations
  monthly_int = (annual_interest.to_f() / 12) * 0.01
  loan_months = loan_years_duration.to_f() * 12

  month_pay = loan_amount.to_f() *
              (monthly_int /
              (1 - (1 + monthly_int)**-loan_months))

  # Output
  prompt("Loan Amount: $#{loan_amount.to_f().round(2)}")
  prompt("Loan Duration: #{loan_months.to_i()} Months")
  prompt("APR: #{annual_interest.to_f().round(2)}\%")
  prompt("Monthly Payment: $#{month_pay.round(2)}")

  prompt("")
  prompt("Perform another Calculation? (Y for yes)")
  answer = Kernel.gets().chomp()
  prompt("----------------------------------")
  break unless answer.downcase.start_with?('y')
end
