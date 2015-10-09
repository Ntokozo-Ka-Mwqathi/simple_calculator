def not_a_number?(number)
  !(number =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/)
end

def not_an_operator?(operator)
  !(operator =~ /[\-\+\*\/\=\n]/m)
end

def ask_for_input
  equation = ""

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
      print "Enter operator (+, -, /, *) or press Enter (or '=') to calculate: "
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
  "= #{eval(equation)} <-- Is this all you wanted? All you've ever dreamed of?"
end


puts calculate(ask_for_input)
puts