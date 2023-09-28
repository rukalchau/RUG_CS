takuzuStrings :: Int -> [String]
takuzuStrings n = generateBitStrings n [""]

generateBitStrings :: Int -> [String] -> [String]
generateBitStrings 0 strs = filter (\s -> countOnes s == countZeros s) strs
generateBitStrings n strs = generateBitStrings (n-1) (concatMap nextBitStrings strs)

nextBitStrings :: String -> [String]
nextBitStrings s = ["0" ++ s, "1" ++ s]

countOnes :: String -> Int
countOnes = length . filter (== '1')

countZeros :: String -> Int
countZeros = length . filter (== '0')

main :: IO ()
main = do
  let n = 3 -- Change this to the desired length
  let result = takuzuStrings n
  mapM_ putStrLn result
