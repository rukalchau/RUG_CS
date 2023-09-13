pow2 :: Integer -> Integer 
pow2 n
    | n == 0 =1
    | n `mod` 2 ==0 = (pow2 (n`div`2))^2
    | otherwise =2* pow2(n-1)