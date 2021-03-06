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

    case input
    when '=' then break
    when 'd' then equation = equation_with_last_input_deleted(equation)
    else update_equation(equation, input)
    end

    print_equation(equation)
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
    if is_number?(input)
      input = Float(input).to_s
      break
    elsif is_availabe_option?(input)
      break
    else
      next
    end
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
  equation << input << " "
end

def equation_with_last_input_deleted(equation)
  equation_arr = equation.split
  equation_arr.pop
  add_spacing(equation_arr)
end

def add_spacing(equation_arr)
  if equation_arr == []
    equation_arr.join("")
  else
    equation_arr.join(" ") << " "
  end
end

def print_equation(equation)
  system "clear"
  puts equation
  print_validity_check(equation)
end

def print_validity_check(equation)
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
