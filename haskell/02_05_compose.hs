compose :: (b -> c) -> (a -> b) -> (a -> c)
compose f g = \x -> f (g x)

inc :: Integer -> Integer
inc x = x + 1

sq :: Integer -> Integer
sq x = x * x

main = do
  print (compose inc sq 2 == 5)
  print (compose inc sq 5 == 26)
