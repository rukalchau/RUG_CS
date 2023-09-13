min2::Int->Int->Int
min2 x y | x>y = y
         | otherwise =x

min3 x y z = min2 x (min2 y z)