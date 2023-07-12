data List a = Nil | Cons a (List a) deriving Eq

foldl' :: List a -> b -> (b -> a -> b) -> b
foldl' Nil z _ = z
foldl' (Cons x xs) z f = foldl' xs (f z x) f

sum' :: List Integer -> Integer
sum' Nil = 0
sum' (Cons x xs) = foldl' xs x (+)

product' :: List Integer -> Integer
product' Nil = 1
product' (Cons x xs) = foldl' xs x (*)

main = do
  print (sum' (Cons 1 (Cons 2 (Cons 3 Nil))) == 6)
  print (product' (Cons 1 (Cons 2 (Cons 3 Nil))) == 6)

