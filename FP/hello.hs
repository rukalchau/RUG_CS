xor :: Bool -> Bool -> Bool 

xor x y = (x||y) && not(x && y)

sq :: Integer -> Integer
sq n = n * n

maxval :: Integer -> Integer ->Integer
maxval x y
    | x>=y = x
    | otherwise = y

pow :: Integer -> Integer -> Integer
pow x n
    | n==0 = 1
    | n>0 = x * pow x (n-1)