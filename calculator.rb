def calculate(equation)
  "#{equation}= #{eval(equation)}"
end

def build_equation
  equation = ""
  loop do 
    number   = get_number
    update_equation(equation, number)
    operator = get_operator
    break if done?(operator)
    update_equation(equation, operator.chomp)
  end
  equation
end

def get_number
  number = ''
  loop do 
    print "Enter number: "
    number = gets.chomp
    break unless not_a_number?(number)
  end
  number
end

def get_operator
  operator = ''
  loop do
    print "Submit operator (+, -, /, *) or press Enter (or '=') to calculate: "
    operator = gets
    break unless not_an_operator?(operator)
  end
  operator
end

def update_equation(equation, user_input)
  update_equation_with_decimal(equation) if division?(user_input)
  equation << user_input << " "
  print_equation(equation)
end

def print_equation(equation)
  puts equation
end

def update_equation_with_decimal(equation)
  equation.chop! << ".0 "
end

def division?(operator)
  operator == "/"
end

def done?(operator)
  operator.chomp == "=" || operator == "\n"
end

def not_a_number?(number)
  !(number =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/)
end

def not_an_operator?(operator)
  !(operator =~ /[\-\+\*\/\=\n]/m)
end

# START's HERE
puts calculate(build_equation)
