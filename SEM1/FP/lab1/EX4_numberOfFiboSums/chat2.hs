import Data.Array

-- Generate the shifted Fibonacci sequence up to n
generateShiftedFibonacci :: Integer -> [Integer]
generateShiftedFibonacci n = takeWhile (<= n) $ 1 : 2 : zipWith (+) (generateShiftedFibonacci n) (tail (generateShiftedFibonacci n))

-- Calculate the number of ways to represent n as a sum of shifted Fibonacci numbers
numberOfFiboSums :: Integer -> Integer
numberOfFiboSums n = dp ! n
  where
    fibs = generateShiftedFibonacci n
    dp = array (0, n) [(i, countWays i) | i <- [0..n]]
    countWays 0 = 1
    countWays i = sum [dp ! (i - fib) | fib <- fibs, fib <= i]

