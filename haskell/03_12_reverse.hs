data List a = Nil | Cons a (List a) deriving Eq

foldl' :: List a -> b -> (b -> a -> b) -> b
foldl' Nil z _ = z
foldl' (Cons x xs) z f = foldl' xs (f z x) f

reverse' :: List a -> List a
reverse' Nil = Nil
reverse' l = foldl' l Nil (\t h -> Cons h t)

main =
  print (reverse' (Cons 1 (Cons 2 (Cons 3 Nil))) == (Cons 3 (Cons 2 (Cons 1 Nil))))

