rangepd :: Integer -> Integer -> Integer
rangepd x y 
    |y<x=0
    |y==x =x
    |otherwise = x * rangepd (x+1) y