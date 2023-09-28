import Data.Char

-- Function to encode a string using the improved Caesar cipher
cipherEncode :: Int -> String -> String
cipherEncode key plaintext = map (\(i, c) -> encodeChar (if i == 1 then 2 else if i == 2 then 3 else key) c) (zip [0..] plaintext)
  where
    encodeChar key c
      | isSpace c = c  -- Leave spaces unchanged
      | otherwise = chr $ ord 'A' + ((ord c - ord 'A' + key) `mod` 26)

-- Function to decode a string using the improved Caesar cipher
cipherDecode :: Int -> String -> String
cipherDecode key ciphertext = map (\(i, c) -> decodeChar (if i == 1 then 2 else if i == 2 then 3 else key) c) (zip [0..] ciphertext)
  where
    decodeChar key c
      | isSpace c = c  -- Leave spaces unchanged
      | otherwise = chr $ ord 'A' + ((ord c - ord 'A' - key + 26) `mod` 26)

-- Example usage:
main :: IO ()
main = do
  let key = 3
      plaintext = "AAA"
      ciphertext = "XUR"
  putStrLn $ "Encoding: " ++ cipherEncode key plaintext
  putStrLn $ "Decoding: " ++ cipherDecode key ciphertext
