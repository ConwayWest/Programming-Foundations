require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(msg)
  Kernel.puts "=> #{msg}"
end

def valid_number?(num)  
  integer?(num) || float?(num)
end

def operation_to_message(op, lang = 'en')
  case lang
  when '1'
    choice = case op
             when '1'
               'Adding'
             when '2'
               'Subtracting'
             when '3'
               'Multiplying'
             when '4'
               'Dividing'
             end
  when '2'
    choice = case op
             when '1'
               'Adición'
             when '2'
               'Restando'
             when '3'
               'Multiplicando'
             when '4'
               'Divisor'
             end
  end
  choice
end

def integer?(number)
  number.to_i().to_s() == number
end

def float?(number)
  number.to_f().to_s() == number
end

def language(num)
  case num
  when '1'
    'en'
  when '2'
    'es'
  end
end

language = ''
loop do
  prompt("#{MESSAGES['language']}")
  language = gets().chomp()

  if %(1 2).include?(language)
    break
  else
    prompt("#{MESSAGES['valid_lang']}")
  end
end

prompt("#{MESSAGES[language(language)]['welcome']}")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("#{MESSAGES[language(language)]['valid_name']}")
  else
    break
  end
end

prompt("#{MESSAGES[language(language)]['hello']}#{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("#{MESSAGES[language(language)]['first_num']}")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("#{MESSAGES[language(language)]['valid_num']}")
    end
  end

  number2 = ''
  loop do
    prompt("#{MESSAGES[language(language)]['second_num']}")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("#{MESSAGES[language(language)]['valid_num']}")
    end
  end

  if language == '1'
    operator_prompt = <<-MSG
      What operation would you like to perform?
      1) add
      2) subtract
      3) mutliply
      4) divide
    MSG
  elsif language == '2'
    operator_prompt = <<-MSG
      ¿Qué operación desea realizar?
      1) añadir
      2) sustraer
      3) multiplicar
      4) dividir
    MSG
  end 

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("#{MESSAGES[language(language)]['valid_op']}")
    end
  end

  prompt("#{operation_to_message(operator, language)}#{MESSAGES[language(language)]['two_numbers']}")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("#{MESSAGES[language(language)]['result']}#{result}.")

  prompt("#{MESSAGES[language(language)]['again']}")
  answer = gets().chomp()

  break unless answer.downcase.start_with?('y')
end

prompt("#{MESSAGES[language(language)]['thanks']}")
