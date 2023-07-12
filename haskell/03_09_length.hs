data List a = Nil | Cons a (List a) deriving Eq

foldr' :: List a -> b -> (a -> b -> b) -> b
foldr' Nil z _ = z
foldr' (Cons x xs) z f = f x (foldr' xs z f)

length' :: List a -> Integer
length' Nil = 0
length' (Cons x xs) = foldr' xs 1 (\_ c -> c + 1)

main = do
  print (foldr' (Cons 1 (Cons 2 (Cons 3 Nil))) 0 (+) == 6)
  print (length' (Cons 1 (Cons 2 (Cons 3 Nil))) == 3)
  print (length' Nil == 0)

