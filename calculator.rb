def calculate(equation)
  system "clear"
  "#{equation}= #{eval(equation)}"
end

def build_equation
  equation = ""
  loop do 
    input = get_input_for_equation
    update_equation(equation, input)
    break if input == '='
  end
  equation
end

def get_input_for_equation
  input = ''
  loop do 
    puts "Enter a number or any of the options below to build your equation."
    puts "Available options: '+', '-', '*', '/', '%', '(', ')' '**'"
    puts "When you are done building your equation, enter '='."
    input = gets.chomp
    break if is_number?(input) || is_availabe_option?(input)
  end
  input
end

def is_number?(input)
  true 
end

def is_availabe_option?(input)
  %w(- + * / % ( ) ** =).include?(input)
end

def update_equation(equation, user_input)
  return if user_input == '='
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

# START's HERE
puts calculate(build_equation)
