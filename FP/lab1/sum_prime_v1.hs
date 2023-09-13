
isPrime :: Integer -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n   | not (null ([x | x <- [2 .. n-1], mod n x == 0])) = False
            | otherwise = True

sumPrimesTo :: Integer -> Integer
sumPrimesTo 1 = 0
sumPrimesTo 2 = 2
sumPrimesTo n | isPrime n = n+sumPrimesTo (n-1)
           | otherwise = sumPrimesTo (n-1)
    