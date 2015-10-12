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
    break if operator_is_equals_sign?(operator)
    update_equation(equation, operator.chomp)
  end
  equation
end

def get_number
  number = ''
  loop do 
    print "Enter number: "
    number = gets.chomp
    break if number?(number)
  end
  number
end

def get_operator
  operator = ''
  loop do
    print "Submit operator (+, -, /, *) or enter '=' to calculate: "
    operator = gets.chomp
    break if operator?(operator)
  end
  operator
end

def update_equation(equation, user_input)
  update_equation_with_decimal(equation) if division?(user_input)
  equation << user_input << " "
  print_equation(equation)
end

def print_equation(equation)
  system "clear"
  puts equation
end

def update_equation_with_decimal(equation)
  equation.chop! << ".0 "
end

def division?(operator)
  operator == "/"
end

def operator_is_equals_sign?(operator)
  operator == "="
end

def number?(number)
  number =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
end

def operator?(operator)
  %w(- * + / =).include?(operator)
end

# START's HERE
puts calculate(build_equation)
