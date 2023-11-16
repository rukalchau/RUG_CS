--1. Declare p to be prime, and cross oﬀ all the multiples of that number in the
--table, starting from p2 ;
--2. Find the next number in the table after p that is not yet crossed oﬀ and set
--p to that number; and then repeat from step 1.

primes ::Integer -> [Integer]
primes n = 2 : [x | x <- [3,5..n], isprime x]
isprime :: Integer -> Bool
isprime x = all (\p -> x `mod` p > 0) (factorsToTry x)
    where
        factorsToTry x = takeWhile (\p -> p*p <= x) (primes x)