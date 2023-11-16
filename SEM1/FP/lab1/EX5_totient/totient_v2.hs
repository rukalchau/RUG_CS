import Data.List (nub)

primeFactors :: Integer -> [Integer]
primeFactors n = factorize n 2
  where
    factorize 1 _ = []
    factorize n factor
      | n `mod` factor == 0 = factor : factorize (n `div` factor) factor
      | otherwise = factorize n (factor + 1)

totient :: Integer -> Integer
totient n = product [(p - 1) * p^(k - 1) | p <- nub (primeFactors n), let k = fromIntegral (length (filter (== p) (primeFactors n)))]

