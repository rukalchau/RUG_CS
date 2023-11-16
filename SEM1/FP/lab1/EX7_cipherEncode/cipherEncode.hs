import Data.Char

-- Function to encode a string using the improved Caesar cipher
cipherEncode :: Int -> String -> String
cipherEncode key plaintext = map (rotateChar key) plaintext

-- Function to decode a string using the improved Caesar cipher
cipherDecode :: Int -> String -> String
cipherDecode key ciphertext = map (rotateChar (-key)) ciphertext

-- Function to rotate a character by a given key
rotateChar :: Int -> Char -> Char
rotateChar key char
  | isUpper char = chr $ ((ord char - ord 'A' + key) `mod` 26) + ord 'A'
  | otherwise = char

main :: IO ()
main = do
  let key = 3
  let plaintext = "AAA"
  let ciphertext = "XUR"
  putStrLn $ "Encoding " ++ plaintext ++ " with key " ++ show key ++ ": " ++ cipherEncode key plaintext
  putStrLn $ "Decoding " ++ ciphertext ++ " with key " ++ show key ++ ": " ++ cipherDecode key ciphertext
