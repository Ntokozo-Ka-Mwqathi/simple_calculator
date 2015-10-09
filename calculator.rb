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

=end

# number_index can only be 1 or 2.
def ask_for_number(one_or_two)
  ordinal_number = proc { |number| "#{number}#{ number == 1 ? 'st' : 'nd'} number: " }
  print "Please enter the #{ordinal_number.call(one_or_two)}"
end

ask_for_number(1)
first_number = gets.chomp

ask_for_number(2)
second_number = gets.chomp
