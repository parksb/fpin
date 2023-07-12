data List a = Nil | Cons a (List a) deriving Eq

tail' :: List a -> List a
tail' Nil = Nil
tail' (Cons _ xs) = xs

main =
  print (tail' (Cons 1 (Cons 2 (Cons 3 Nil))) == (Cons 2 (Cons 3 Nil)))

