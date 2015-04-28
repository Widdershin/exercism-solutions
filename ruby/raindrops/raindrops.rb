require 'prime'

class Raindrops < Struct.new(:number)
  def self.convert(number)
    new(number).drip
  end

  def drip
    if three_five_or_seven_are_prime_factors?
      pling_plang_plong
    else
      number.to_s
    end
  end

  private

  def three_five_or_seven_are_prime_factors?
    (prime_factors & [3, 5, 7]).any?
  end

  def pling_plang_plong
    [
      pling,
      plang,
      plong,
    ].join
  end

  def prime_factors
    number.prime_division.flatten
  end

  def pling
    "Pling" if prime_factors.include? 3
  end

  def plang
    "Plang" if prime_factors.include? 5
  end

  def plong
    "Plong" if prime_factors.include? 7
  end
end

