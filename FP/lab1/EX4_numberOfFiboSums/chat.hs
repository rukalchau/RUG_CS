import Data.Array

-- Function to generate the shifted Fibonacci numbers up to n
generateFibonacci :: Integer -> [Integer]
generateFibonacci n = takeWhile (<= n) $ 1 : 2 : zipWith (+) (generateFibonacci n) (tail $ generateFibonacci n)

-- Function to count the number of ways to represent n as a sum of Fibonacci numbers
numberOfFiboSums :: Integer -> Integer
numberOfFiboSums n = dp ! n
  where
    fibs = generateFibonacci n
    dp = array (0, n) [(i, countWays i) | i <- [0..n]]
    countWays 0 = 1
    countWays i = sum [dp ! (i - fib) | fib <- fibs, fib <= i]

main :: IO ()
main = do
  let n = 64
  putStrLn $ "Number of ways to represent " ++ show n ++ " as a sum of Fibonacci numbers: " ++ show (numberOfFiboSums n)
