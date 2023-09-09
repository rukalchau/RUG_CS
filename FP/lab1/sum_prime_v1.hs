
isPrime :: Integer -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n   | not (null ([x | x <- [2 .. n-1], mod n x == 0])) = False
            | otherwise = True

primeSum :: Integer -> Integer
primeSum 1 = 0
primeSum 2 = 2
primeSum n | isPrime n = n+primeSum (n-1)
           | otherwise = primeSum (n-1)
