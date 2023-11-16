module Debug (traceThis, debug, abort, printf) where

import Debug.Trace
import Text.Printf

traceThis :: (Show a) => a -> a
traceThis x = trace ("trace: " ++ show x) x

debug :: a -> String -> a
debug = flip trace

abort :: String -> a
abort msg = errorWithoutStackTrace msg
