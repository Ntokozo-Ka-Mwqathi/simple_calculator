def get_number
  number = ''
  loop do 
    puts "Enter number:"
    number = gets.chomp
    break unless not_a_number?(number)
  end
  number
end

def get_operator
  operator = ''
  loop do
    puts "Enter operator (+, -, /, *) or press Enter (or '=') to calculate:"
    operator = gets
    break unless not_an_operator?(operator)
  end
  opertor
end

def add_to_equation

end

def done?(operator)
end

def ask_for_input
  equation = ""

  loop do
    number   = get_number
    operator = get_operator
    done?(opertor)
    add_to_equation(number)
    add_to_equation(operator)

      equation << number << " "
      puts equation

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

def not_a_number?(number)
  !(number =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/)
end

def not_an_operator?(operator)
  !(operator =~ /[\-\+\*\/\=\n]/m)
end

def calculate(equation)
  "= #{eval(equation)}?"
end


puts calculate(ask_for_input)
puts