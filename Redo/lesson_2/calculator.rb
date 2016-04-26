# Walk-through: Calculator

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  # if num.to_i.to_s == num
  #   true
  # elsif num.to_f.to_s == num
  #   true
  # else
  #   false
  # end
  Integer(num) rescue false || Float(num) rescue false
end

def operation_to_message(op)
  word = case op
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
         end
  word
end

prompt(messages('welcome'))

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('valid_name'))
  else
    break
  end
end

prompt(messages('hello') + "#{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('first_num'))
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(messages('valid_num'))
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_num'))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(messages('valid_num'))
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('choose'))
    end
  end

  prompt("#{operation_to_message(operator)}" + messages('two_num'))

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt(messages('result') + "#{result}")

  prompt(messages('again?'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thank_you'))
