# When done, submit this entire file to the autograder.

# Part 1
# Define a method sum(array) that takes an array of integers as an argument and returns the 
# sum of its elements. For an empty array it should return zero. 
# Run associated tests via: $ rspec spec/part1_spec.rb:5
def sum arr
  arr.inject(0,:+)
end

# Define a method max_2_sum(array) which takes an array of integers as an argument and returns the 
# sum of its two largest elements. For an empty array it should return zero. For an array with just 
# one element, it should return that element. Run associated tests via: $ rspec spec/part1_spec.rb:23
def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.count == 1
  arr.sort!.reverse!
  arr[0] + arr[1]
end

# Define a method sum_to_n?(array, n) that takes an array of integers and an additional integer, n, as arguments 
# and returns true if any two elements in the array of integers sum to n. sum_to_n?([], n) should return false for 
# any value of n, by definition. Run associated tests via: $ rspec spec/part1_spec.rb:42
def sum_to_n? arr, n
  return false if arr.empty? || arr.count == 1
  sums = arr.combination(2).map { |a,b| a + b }
  sums.include? n
end

# Part 2

# Define a method hello(name) that takes a string representing a name and returns the string "Hello, " 
# concatenated with the name. Run associated tests via: $ rspec -e '#hello' spec/part2_spec.rb
def hello(name)
  "Hello, #{name}"
end

# Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant 
# and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it 
# works for both upper and lower case and for nonletters! 
# Run associated tests via: $ rspec -e '#starts_with_consonant?' spec/part2_spec.rb
def starts_with_consonant? s
  s =~ /^[^aeiouAEIOU\W]/
end

# Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a 
# binary number that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number! 
# Run associated tests via: $ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb
def binary_multiple_of_4? s
  return false if /[^01]/.match(s) || s.empty?
  s.to_i(2) % 4 == 0
end

# Part 3

class BookInStock
  def initialize (isbn, price)
    @isbn = valid_isbn(isbn)
    @price = valid_price(price)
  end

  def isbn
    @isbn
  end

  def isbn=(isbn)
    @isbn = valid_isbn(isbn)
  end

  def price
    @price
  end

  def price=(price)
    @price = valid_price(price)
  end

  def price_as_string
    "$#{sprintf('%.2f', @price)}"
  end

  private
  def valid_isbn(isbn)
    if isbn == ''
      raise ArgumentError, 'Blank ISBN Number'
    else
      return isbn
    end
  end

  def valid_price(price)
    if price < 1
      raise ArgumentError, 'Price must be greater than 0.00'
    else
      return price
    end
  end

end
