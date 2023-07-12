data List a = Nil | Cons a (List a) deriving Eq

init' :: List a -> List a
init' Nil = Nil
init' (Cons _ Nil) = Nil
init' (Cons x xs) = Cons x (init' xs)

main =
  print (init' (Cons 1 (Cons 2 (Cons 3 Nil))) == (Cons 1 (Cons 2 Nil)))

