charToNum :: Char -> Int
charToNum x
    |x<'0'= 0
    |x>'9'= 0
    |otherwise = fromEnum x -fromEnum '0'