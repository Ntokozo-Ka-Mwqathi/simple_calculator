def calculate(equation)
  begin
    "#{equation}= #{eval(equation)}"
  rescue(SyntaxError)
    puts "That is not a valid equation."
  end
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
  input =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
end

def is_availabe_option?(input)
  %w(- + * / % ( ) ** =).include?(input)
end

def update_equation(equation, input)
  return if input == '='
  update_equation_with_decimal(equation) if input == '/'
  equation << input << " "
  print_equation(equation)
end

def update_equation_with_decimal(equation)
  equation.chop! << ".to_f "
end

def print_equation(equation)
  system "clear"
  puts equation
end

# START's HERE
system "clear"
puts calculate(build_equation)
