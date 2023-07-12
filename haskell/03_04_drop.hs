data List a = Nil | Cons a (List a) deriving Eq

drop' :: List a -> Integer -> List a
drop' Nil _ = Nil
drop' xs 0 = xs
drop' (Cons _ xs) n = drop' xs (n - 1)

main =
  print (drop' (Cons 1 (Cons 2 (Cons 3 Nil))) 2 == (Cons 3 Nil))

