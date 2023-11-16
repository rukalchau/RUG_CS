fib :: Integer -> Integer
fib n = go n (1,2)
    where 
        go n (a,b) | n ==0 = a
                   | otherwise = go (n-1)(b,a+b)

fibList :: Integer -> [Integer]
fibList n = tx n [1,2]
    where 
        tx n xs | n==0 = xs
                | otherwise = tx(n-1)(concat[xs,[last xs + last(init xs)]])