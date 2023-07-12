isSorted :: Ord a => [a] -> (a -> a -> Bool) -> Bool
isSorted [] _ = True
isSorted [_] _ = True
isSorted l f = f (l !! 0) (l !! 1) && isSorted (tail l) f

asc :: Ord a => a -> a -> Bool
asc x y = if x <= y then True else False

desc :: Ord a => a -> a -> Bool
desc x y = if x >= y then True else False

main = do
  print (isSorted [1, 2, 3] asc == True)
  print (isSorted [3, 2, 1] asc == False)
  print (isSorted [1, 2, 3] desc == False)
  print (isSorted [3, 2, 1] desc == True)

