data List a = Nil | Cons a (List a) deriving Eq

setHead' :: a -> List a -> List a
setHead' _ Nil = Nil
setHead' x (Cons _ ys) = Cons x ys

main =
  print (setHead' 1 (Cons 2 (Cons 3 Nil)) == (Cons 1 (Cons 3 Nil)))

