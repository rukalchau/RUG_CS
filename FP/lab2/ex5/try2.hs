import Data.Ratio
import Data.List

-- Function to convert a ratio to its repeating decimal representation as a string
ratioToRepeatingDecimal :: Integer -> Integer -> String
ratioToRepeatingDecimal numerator denominator =
    let (q, r) = numerator `divMod` denominator
        wholePart = show q
        remainder = show r
        recurringPart = fractionToRepeatingDecimal r denominator []
    in wholePart ++ "." ++ remainder ++ recurringPart

-- Function to find the repeating part of a fraction
fractionToRepeatingDecimal :: Integer -> Integer -> [(Integer, Integer)] -> String
fractionToRepeatingDecimal 0 _ _ = ""
fractionToRepeatingDecimal remainder denominator seen
    | (remainder, denominator) `elem` seen = "..."
    | otherwise =
        let (q, r) = (10 * remainder) `divMod` denominator
        in show q ++ fractionToRepeatingDecimal r denominator ((remainder, denominator) : seen)
