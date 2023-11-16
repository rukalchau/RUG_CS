import Control.Concurrent.STM (check)
import Data.ByteString.Lazy.Char8 (group)

isNthRootOfUnity :: Integer -> Integer -> Integer ->Bool
isNthRootOfUnity x n m = go x n m ==1

go x 1 m = x `mod` m
go x n m | even n = ((go x (n `div` 2) m) ^ 2) `mod` m 
         | odd n = (((go x ((n-1)`div` 2) m) ^ 2 )*x)`mod` m







-- stack overflow !!!