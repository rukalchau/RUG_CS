
isNthRootOfUnity :: Integer -> Integer -> Integer -> Bool
isNthRootOfUnity x n m = null([i|i<-[2..x],m`rem`i==0 && x`rem`i==0])

-- stack overflow !!!