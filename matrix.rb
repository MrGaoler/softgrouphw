
def eratosthenes(n)
numbs = Array.[](nil, nil, *2..n)
(2..Math.sqrt(n)).each do |i|
(i**2..n).step(i){|m| numbs[m] = nil} if numbs[i]

end
numbs.compact
end
 numb = Array.new(4) { Array.new(numbs)}

p eratosthenes(10)
