# Class Prime_numb
#   def prime?
#     n = [].to_a
#     n[1] = 0
#       n.each do
#         return  false  if (n==1)
#     for (k=2,k<=s,k++)
#       n[k]=1
#       for(k=2,k*k<=s,k++)
#         if(s[k]==1)
#         for(l=k*k, l<=n,l+=k)
#         s[l]=0
#
#       end
#     end
# return n

def eratosthenes(n)
numbs = Array.[](nil, nil, *2..n)
(2..Math.sqrt(n)).each do |i|
(i**2..n).step(i){|m| numbs[m] = nil} if numbs[i]

end
@numbs.compact
end
 numb = Array.new(4) { Array.new(@numbs)}

p eratosthenes(10)
