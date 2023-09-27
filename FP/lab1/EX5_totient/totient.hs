totient :: Integer -> Integer
totient y = numCoprime y 0

numCoprime n x | n ==x = 0 
               | otherwise = check n x

check a b | b==a =0
          | a<=0 =0
          | gcd a b == 1 = (check a b+1) +1
          | otherwise =check (a-(gcd a b)) 1