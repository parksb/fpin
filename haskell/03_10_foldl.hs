data List a = Nil | Cons a (List a) deriving Eq

foldl' :: List a -> b -> (b -> a -> b) -> b
foldl' Nil z _ = z
foldl' (Cons x xs) z f = foldl' xs (f z x) f

main =
  print (foldl' (Cons 1 (Cons 2 (Cons 3 Nil))) 0 (-) == -6)

