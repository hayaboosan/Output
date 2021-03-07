def get_numbers
  puts "1以上の数値を入力してください"
  numbers = gets.to_i
end

def numbers_check
  numbers = 0
  while numbers < 1
    numbers = get_numbers unless numbers > 0
  end
  return numbers
end

def fizz_buzz(numbers)
  (1..numbers).each do |number|
    case 
    when number % 3 == 0 && number % 5 ==0
      puts "FizzBuzz!"
    when number % 3 == 0
      puts "Fizz!"
    when number % 5 == 0
      puts "Buzz!"
    else
      puts number
    end
  end
end

numbers = numbers_check
fizz_buzz numbers