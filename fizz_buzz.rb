# frozen_string_literal: true

def attribute_numbers
  puts '1以上の数値を入力してください'
  gets.to_i
end

def numbers_check
  numbers = 0
  numbers = attribute_numbers unless numbers.positive? while numbers < 1
  numbers
end

def fizz_buzz(numbers)
  (1..numbers).each do |number|
    if (number % 15).zero? then puts 'FizzBuzz!'
    elsif (number % 3).zero? then puts 'Fizz!'
    elsif (number % 5).zero? then puts 'Buzz!'
    else puts number
    end
  end
end

numbers = numbers_check
fizz_buzz numbers
