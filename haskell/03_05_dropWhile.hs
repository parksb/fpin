data List a = Nil | Cons a (List a) deriving Eq

dropWhile' :: List a -> (a -> Bool) -> List a
dropWhile' Nil _ = Nil
dropWhile' (Cons x xs) f = if f x then dropWhile' xs f else Cons x xs

lt3 :: Integer -> Bool
lt3 x = x < 3

main =
  print (dropWhile' (Cons 1 (Cons 2 (Cons 3 Nil))) lt3 == (Cons 3 Nil))

