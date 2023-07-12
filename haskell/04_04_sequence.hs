data List a = Nil | Cons a (List a) deriving Eq
data Option a = None | Some a deriving Eq

map' :: Option a -> (a -> b) -> Option b
map' None f = None
map' (Some x) f = Some (f x)

fmap' :: Option a -> (a -> Option b) -> Option b
fmap' None f = None
fmap' (Some x) f = f x

sequence' :: List (Option a) -> Option (List a)
sequence' Nil = Some(Nil)
sequence' (Cons x xs) = fmap' x (\h -> map' (sequence' xs) (\t -> Cons h t))

main = do
  print (sequence' (Cons (Some 1) (Cons (Some 2) Nil)) == Some (Cons 1 ( Cons 2 Nil)))
  print (sequence' (Cons (Some 1) (Cons None Nil)) == None)

