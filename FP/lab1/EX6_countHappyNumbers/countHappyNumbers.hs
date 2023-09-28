import Data.Char (digitToInt)

sumOfSquaresOfDigits :: Integer -> Integer
sumOfSquaresOfDigits = sum . map (\c -> fromIntegral (digitToInt c)^2) . show

isHappyNumber :: Integer -> Bool
isHappyNumber n = isHappy n []

isHappy :: Integer -> [Integer] -> Bool
isHappy 1 _ = True
isHappy n seen
  | n `elem` seen = False
  | otherwise = isHappy (sumOfSquaresOfDigits n) (n : seen)

countHappyNumbers :: Integer -> Integer -> Int
countHappyNumbers a b = length [x | x <- [a..b], isHappyNumber x]
