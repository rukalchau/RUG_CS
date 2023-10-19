selfrle :: [Int]
selfrle = generate (2,2,1,2)
  where
    generate (a,b,c,d) | (a == b && c == d) = a:generate (b,c,d,a)
                       | otherwise = mod a 2 + 1 :generate (b,c,d,mod a 2 +1)

    -- a a b a -> b
    -- a b a b -> b
    -- a a b b -> a
    -- a b b a -> b
--   2 1 2     1     