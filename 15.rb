n = 20
def fact(n)
  if n == 0
    1
  else
    n * fact(n-1)
  end
end
puts ( fact(2*n) )/ ( (fact(n))**2)
