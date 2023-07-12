fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

main = do
  print (fib 0 == 0)
  print (fib 1 == 1)
  print (fib 5 == 5)
  print (fib 10 == 55)
