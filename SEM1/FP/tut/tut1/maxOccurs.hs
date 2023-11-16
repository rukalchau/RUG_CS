maxOccurs::Integer->Integer->(Integer,Integer)
maxOccurs x y
    | x > y = (x,1)
    | x < y = (y,1)
    | x== y = (x,2)

max3Occure :: Integer -> Integer ->Integer ->(Integer,Integer)
max3Occure a b c
    |c<m =(m,cnt)
    |c==m =(m,cnt+1)
    |otherwise =(c,1)
        where (m,cnt) = maxOccurs a b