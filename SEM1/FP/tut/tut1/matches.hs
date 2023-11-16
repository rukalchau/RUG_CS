mataches:: Integer -> [Integer] -> [Integer]
mataches n xs=[i|i<-xs,n==i]

isElementof n[] = False
isElementof n xs = True