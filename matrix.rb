class PrimeNumbers
  def prime?(n)
    @num = [nil, nil, *2..n]
    (2..Math.sqrt(n)).each do |i|
    (i**2..n).step(i){|m| @num[m] = nil} if @num[i]
    end
  output
  end

  def output
    (@num.size - 6).times do
    p @num.push(@num.shift).compact
  end

    end

end
lol = PrimeNumbers.new
lol.prime?(10)

# @num = @num.compact
# p @num.push(5)
