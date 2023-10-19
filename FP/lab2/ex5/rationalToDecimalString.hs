import Data.Char (intToDigit)

rationalToDecimalString :: Int -> Int -> String
rationalToDecimalString num denom
  | denom == 0 = "Undefined" -- Handle division by zero
  | otherwise = integerPart ++ "." ++ decimalPart
  where
    (q, r) = num `divMod` denom
    integerPart = show q
    (decimalPart, repeatingPart) = go r denom [] []

    go 0 _ _ _ = ("", "")
    go n d seen quotient
        | (n, d) `elem` seen = (quotient ++ "(" ++ concatMap show quotient ++ ")", "")
        | otherwise =
            let (q', r') = (n * 10) `divMod` d
            in go r' d ((n, d) : seen) (quotient ++ [intToDigit q'])

main :: IO ()
main = putStrLn $ rationalToDecimalString 1 3



