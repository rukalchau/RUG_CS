import Data.Char
import Debug

{- parser for the grammar:
    S -> F S'
    S' -> * F S' 
    S' -> / F S'
    S' -> <empty string>
    F -> <digits>
-}

type Token  = String
type Tokens = [String]

lexer :: String -> Tokens
lexer [] = []
lexer str@(c:cs)
  | elem c "\n\t "  = lexer cs -- skip whitespace
  | elem c "*/"  = [c]:(lexer cs)
  | isDigit c    = takeWhile isDigit str : lexer(dropWhile isDigit str)
  | otherwise    = abort $ printf "illegal character '%c' found." c

parseS :: (String,Tokens) -> (String,Tokens)
parseS = parseS'.parseF

parseS' :: (String,Tokens) -> (String,Tokens)
parseS' (acc,"*":toks) = parseS' $ parseF (acc++"*",toks)
parseS' (acc,"/":toks) = parseS' $ parseF (acc++"/",toks)
parseS' (acc,toks)     = (acc, toks)

parseF :: (String,Tokens) -> (String,Tokens)
parseF (acc,[])      =  abort "error: unexpected end of input."
parseF (acc,tok:toks)
  | isDigit (head tok) =  (acc++tok, toks)
  | otherwise          =  abort $ printf "Error, unexpected '%s'." tok

parser :: String -> (String,Tokens)
parser str = parseS ("",lexer str)
