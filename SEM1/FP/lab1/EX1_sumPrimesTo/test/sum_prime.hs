import Data.List
import qualified Data.Map as M

primes :: [Integer]
primes = mkPrimes 2 M.empty
  where
    mkPrimes n m = case (M.null m, M.findMin m) of
        (False, (n', skips)) | n == n' ->
            mkPrimes (succ n) (addSkips n (M.deleteMin m) skips)
        _ -> n : mkPrimes (succ n) (addSkip n m n)
    addSkip n m s = M.alter (Just . maybe [s] (s:)) (n+s) m
    addSkips = foldl' . addSkip

-- fuse:
main = print (sum (takeWhile (<= 2000000) primes))