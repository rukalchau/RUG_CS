fastPow :: Integer -> Integer -> Integer -> Integer
fastPow base 1 m = mod base m
fastPow base pow m | even pow = mod ((fastPow base (div pow 2) m) ^ 2) m
                   | odd  pow = mod ((fastPow base (div (pow-1) 2) m) ^ 2 * base) m