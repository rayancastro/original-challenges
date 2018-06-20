def fizz_buzz(number)
  raise ArgumentError.new("Only positive non-zero numbers allowed") if number < 1
  array = (1..number.to_i).to_a
  array.map! do |e|
    if (e % 3).zero? && (e % 5).zero?
      "FizzBuzz"
    elsif (e % 3).zero?
      "Fizz"
    elsif (e % 5).zero?
      "Buzz"
    else
      e
    end
  end
  array
end
