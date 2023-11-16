import Data.List
import Data.Char (chr)
import Data.Maybe

intToDecimalString :: Int -> Int -> String
intToDecimalString numerator denominator = show (numerator `div` denominator) ++ "." ++ go (numerator `rem` denominator) []
  where
    go 0 _ = ""
    go x xs
      | x `elem` xs = let (before, repeating) = splitAt (fromJust (elemIndex x xs)) xs
                      in unwords (map show before) ++ " (" ++ unwords (map show repeating) ++ ")"
      | otherwise = let (q, r) = x `quotRem` denominator in chr (48 + q) : go (r * 10) (x : xs)
