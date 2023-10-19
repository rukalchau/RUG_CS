selfrle :: [Int]
selfrle = 1 : go 2
  where
    go n = replicate n n ++ selfrle
