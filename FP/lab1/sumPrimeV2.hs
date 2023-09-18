

isPrime :: Integer -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n = not(null [i|i<-[3,5..n-1],n `mod` i ==0])

sumPrimesTo :: Integer -> Integer
sumPrimesTo 1 = 0
sumPrimesTo 2 = 2
sumPrimesTo n | isPrime n = n+sumPrimesTo (n-1)
              | otherwise = sumPrimesTo (n-1)
    