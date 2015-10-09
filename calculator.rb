=begin
What are you trying to build?
  A calculator that can add, subtract, multiply, and divide two
  inputs.

What are the logical steps to accomplish your goal?

  Input
    - Ask user for first_number. 
    - If first_number != integer, raise error and repeat.
    - Ask user for second_number.
    - If first_number != integer, raise error and repeat.
    - Ask user for a symbol (+, -, *, or /).
    - If first_number != (+, -, *, or /), raise error and repeat.
  
  Calculation
    - If the symbol is '+', add the two numbers.
    - Elsif the symbol is '-', subtract the two numbers.
    - Elsif the symbol is '*', multiply the two numbers.
    - Else the symbol is '/', so divide the two numbers.

  Output
    - Print the answer.

ask
get if not number: error
print
ask
get
print

to_arr
each
  add number to "equals" if first in arr
  case
    number
    symbol

1, 2, 3, 4, 5
   *, /, %, -

=end


def not_a_number?(number)
  !(number =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/)
end

def not_an_operator?(operator)
  !(operator =~ /[\-\+\*\/\=\n]/m)
end

def ask_for_input
  equation  = ""

  loop do
    print "Enter number: "
    number = gets.chomp
    if not_a_number?(number)
      puts "That's not a number, idiot!"
      redo
    else
      equation << number << " "
      puts equation
    end

    loop do
      print "Enter operator: "
      operator = gets
      if not_an_operator?(operator)
        puts "That's not an operator, jerk!"
        redo
      elsif operator == "=" || operator == "\n"
        puts
        print equation
        return equation
      else
        equation  << operator.chomp << " "
        puts equation
        break
      end
    end
  end
end

def calculate(equation)
  "= #{eval(equation)}"
end

puts calculate(ask_for_input)
puts
