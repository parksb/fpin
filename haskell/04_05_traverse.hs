data List a = Nil | Cons a (List a) deriving Eq
data Option a = None | Some a deriving Eq

map' :: Option a -> (a -> b) -> Option b
map' None f = None
map' (Some x) f = Some (f x)

fmap' :: Option a -> (a -> Option b) -> Option b
fmap' None f = None
fmap' (Some x) f = f x

traverse' :: List a -> (a -> Option b) -> Option (List b)
traverse' Nil _ = Some(Nil)
traverse' (Cons x xs) f = fmap' (f x) (\h -> map' (traverse' xs f) (\t -> Cons h t))

read' :: Option String -> Option Integer
read' None = None
read' (Some x) = Some (read x)

main = do
  print (traverse' (Cons (Some "1") (Cons (Some "2") Nil)) read' == Some (Cons 1 ( Cons 2 Nil)))
  print (traverse' (Cons (Some "1") (Cons None Nil)) read' == None)

