isPrime :: Integral p => p -> Bool
isPrime n = go 2
  where
    go d
      | d*d > n        = True
      | n `rem` d == 0 = False
      | otherwise      = go (d+1)

primes = filter isPrime [2 .. ]