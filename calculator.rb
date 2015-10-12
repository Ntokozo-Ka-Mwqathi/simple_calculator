def calculate(equation)
  system "clear"
  "#{equation}= #{eval(equation)}"
end

def build_equation
  equation = ""
  loop do 
    number = get_number
    update_equation(equation, number)
    operator = get_operator
    break if operator == '='
    update_equation(equation, operator)
  end
  equation
end

def get_number
  number = ''
  loop do 
    print "Enter number: "
    number = gets.chomp
    break if is_number?(number)
  end
  number
end

def is_number?(string)
  true if Float(string) rescue false
end

def update_equation(equation, user_input)
  update_equation_with_decimal(equation) if user_input == '/'
  equation << user_input << " "
  print_equation(equation)
end

def update_equation_with_decimal(equation)
  equation.chop! << ".0 "
end

def print_equation(equation)
  system "clear"
  puts equation
end

def get_operator
  operator = ''
  loop do
    print "Submit operator (+, -, /, *) or enter '=' to calculate: "
    operator = gets.chomp
    break if is_operator?(operator)
  end
  operator
end

def is_operator?(operator)
  %w(- * + / =).include?(operator)
end

# START's HERE
puts calculate(build_equation)
