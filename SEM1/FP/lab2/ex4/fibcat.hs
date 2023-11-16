fibcat = merge fibonacci catalan
  where
    fibonacci = 0 : 1 : zipWith (+) fibonacci (tail fibonacci)
    catalan = xs
      where xs = 1 : zipWith f [0..] xs
            f n cn = div ((4*n+2) * cn) (n+2)

    merge :: [Integer] -> [Integer] -> [Integer]
    merge [] ys = ys
    merge xs [] = xs
    merge (x:xs) (y:ys)
      | x < y = x : merge xs (y:ys)
      | x > y = y : merge (x:xs) ys
      | x==y && head xs == x && head ys == y =  merge xs ys
      |otherwise = x : merge xs ys
