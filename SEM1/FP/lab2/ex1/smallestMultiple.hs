import Data.List (foldl')

lcm' a b = (a * b) `div` (gcd a b)
smallestMultiple n = foldl' lcm' 1 [1..n]

