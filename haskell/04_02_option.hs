data Option a = None | Some a deriving Eq

map' :: Option a -> (a -> b) -> Option b
map' None f = None
map' (Some x) f = Some (f x)

fmap' :: Option a -> (a -> Option b) -> Option b
fmap' None f = None
fmap' (Some x) f = f x

getOrElse :: Option a -> a -> Option a
getOrElse None x = Some x
getOrElse x _ = x

orElse :: Option a -> Option a -> Option a
orElse None x = x
orElse (Some x) _ = Some x

filter' :: Option a -> (a -> Bool) -> Option a
filter' None f = None
filter' (Some x) f = if f x then Some x else None

main = do
  print (map' (Some 1) (\x -> x + 1) == Some 2)
  print (fmap' (Some 1) (\x -> Some(x + 1)) == Some 2)
  print (filter' (Some 1) (\x -> x > 0) == Some 1)
  print (filter' (Some 1) (\x -> x < 0) == None)
  print (getOrElse (Some 1) 2 == Some 1)
  print (getOrElse None 2 == Some 2)
  print (orElse None (Some 2) == Some 2)
  print (orElse (Some 2) None == Some 2)

