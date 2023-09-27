fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs
 
zeck :: Integer -> [Integer]
zeck 0 = []
zeck n = f : zeck (n - f) 
    where f = last $ takeWhile (<= n) fibs

