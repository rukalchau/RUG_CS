chebyshev :: Integer -> Integer
chebyshev n = go n (0,2)
    where 
        go n (a,b) | n ==0 = a
                   | otherwise = go (n-1)(b,4*b-a)