curry' :: ((a, b) -> c) -> (a -> b -> c)
curry' f = \x y -> f (x, y)

add :: (Integer, Integer) -> Integer
add (x, y) = x + y

times :: (Integer, Integer) -> Integer
times (x, y) = x * y

main = do
  print (curry' add 3 7 == 10)
  print (curry' times 5 3 == 15)
