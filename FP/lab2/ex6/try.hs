import Data.Char
import Debug

{- parser for the grammar:
    S -> F S'
    S' -> * F S' 
    S' -> / F S'
    S' -> % F S'
    S' -> <empty string>
    F -> <digits>
    F -> ( S )
    F -> - F
-}

type Token  = String
type Tokens = [String]

lexer :: String -> Tokens
lexer [] = []
lexer str@(c:cs)
  | elem c "\n\t "  = lexer cs -- skip whitespace
  | elem c "*/%"  = [c]:(lexer cs) -- add modulus operator %
  | isDigit c    = takeWhile isDigit str : lexer(dropWhile isDigit str)
  | otherwise    = abort $ printf "illegal character '%c' found." c

-- Define a new data type to represent the result of parsing and evaluating an expression
data Result = Result Integer Tokens

-- Helper function to update the result by applying an operator to the current result and a new integer
applyOp :: Result -> String -> Integer -> Result
applyOp (Result acc toks) "*" x = Result (acc * x) toks
applyOp (Result acc toks) "/" x = Result (acc `div` x) toks
applyOp (Result acc toks) "%" x = Result (acc `mod` x) toks

parseS :: (String, Tokens) -> (Integer, Tokens)
parseS = parseS' . parseF

parseS' :: (Result, Tokens) -> (Integer, Tokens)
parseS' (acc, "*":toks) = parseS' $ applyOp acc "*" (parseF toks)
parseS' (acc, "/":toks) = parseS' $ applyOp acc "/" (parseF toks)
parseS' (acc, "%":toks) = parseS' $ applyOp acc "%" (parseF toks)
parseS' (Result result toks, toks') = (result, toks')
parseS' (acc, toks) = (getResult acc, toks)

parseF :: Tokens -> Result
parseF ("(":toks) = case parseS (toks, lexer "") of
  (result, ")":toks') -> Result result toks'
  _ -> abort "Error: Unmatched parentheses."
parseF ("-" : toks) = applyOp (parseF toks) "*" (-1)
parseF (x:toks) = Result (read x) toks
parseF [] = abort "Error: Unexpected end of input."

getResult :: Result -> Integer
getResult (Result result _) = result

parser :: String -> (Integer, Tokens)
parser str = (parseS ("", lexer str))

-- Example usage:
-- parser "21*8/2/2 7*2" will evaluate to (42, ["7","*","2"])
-- parser "-(42%(5*3))" will evaluate to (-12, [])
-- parser "-(42%5*3)" will evaluate to (-6, [])
