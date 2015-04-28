class Squares < Struct.new(:number_to_calculate_up_to)
  def square_of_sums
    numbers.sum ** 2
  end

  def sum_of_squares
    numbers.map { |i| i ** 2 }.sum
  end

  def difference
    square_of_sums - sum_of_squares
  end

  private

  def numbers
    (1..number_to_calculate_up_to)
  end
end

module Enumerable
  def sum
    reduce(&:+)
  end
end
