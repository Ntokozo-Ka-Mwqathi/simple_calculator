def calculate(equation)
  system "clear"
  begin
    "#{equation}= #{eval(equation)}"
  rescue(SyntaxError)
    "That is not a valid equation."
  end
end

def build_equation
  equation = ""
  loop do 
    input = get_input_for_equation
    update_equation(equation, input)
    equation = delete_previous_entry(equation) if input == 'd'
    break if input == '='
  end
  equation
end

def get_input_for_equation
  input = ''
  loop do 
    puts "Enter a number or any of the options below to build your equation."
    puts "Available options: '+', '-', '*', '/', '%', '(', ')' '**' 'd'"
    puts "Enter 'd' to delete the previous entry"
    puts "Once you're done building your equation, check that its valid, then enter '='."
    input = gets.chomp
    break if is_number?(input) || is_availabe_option?(input)
  end
  input
end

def is_number?(input)
  input =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
end

def is_availabe_option?(input)
  %w(- + * / % ( ) ** = d).include?(input)
end

def update_equation(equation, input)
  return if input == '='
  update_equation_with_decimal(equation) if input == '/'
  equation = delete_previous_entry(equation) if input == 'd'
  equation << input << " " unless input == 'd'
  print_equation(equation)
end

def update_equation_with_decimal(equation)
  equation.chop! << ".to_f "
end

def delete_previous_entry(equation)
  equation_arr = equation.split
  equation_arr.pop
  equation_arr.join(" ") << " "
end

def print_equation(equation)
  system "clear"
  puts equation
  begin
    "#{eval(equation)}"
  rescue(SyntaxError)
    puts "\e[31;49m~~Not valid~~\e[0m"
  else
    puts "\e[32;49m~~Valid~~\e[0m"
  end
end

system "clear"
puts calculate(build_equation)
