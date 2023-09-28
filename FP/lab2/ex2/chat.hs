primes :: [Integer]
primes = sieve [2..]
  where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]


primeFactorization :: Integer -> [Integer]
primeFactorization n = factorize n primes
  where
    factorize _ [] = []
    factorize m (p:ps)
      | p * p > m = [m]
      | m `mod` p == 0 = p : factorize (m `div` p) (p:ps)
      | otherwise = factorize m ps

composites :: [(Integer, [Integer])]
composites = [(c, primeFactorization c) | c <- [4..], let factors = primeFactorization c, factors /= [c]]
