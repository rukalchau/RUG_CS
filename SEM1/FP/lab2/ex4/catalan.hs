catalan :: Integral i => [i]
catalan = xs
    where xs = 1 : zipWith f [0..] xs
          f n cn = div ((4*n+2) * cn) (n+2)