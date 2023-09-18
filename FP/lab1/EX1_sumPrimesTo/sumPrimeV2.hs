

isPrime :: Integer -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n = check 2
    where check f | f^2>n = True
                  | rem n f ==0 = False
                  | otherwise = check (f+1)


sumPrimesTo :: Integer -> Integer
sumPrimesTo 0 = 0
sumPrimesTo 1 = 0
sumPrimesTo 2 = 2
sumPrimesTo n | isPrime n = n+sumPrimesTo (n-1)
              | otherwise = sumPrimesTo (n-1)
    