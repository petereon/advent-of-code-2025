module Main where

main :: IO ()
main = do
    input <- readFile "data/input.txt"
    let intervals = map getRanges (splitOnPredicate (',' ==) input)
    print $ sum $ concatMap findMagicNumbers intervals

splitOnPredicate :: (Char -> Bool) -> String -> [String]
splitOnPredicate _ [] = [""]
splitOnPredicate predicate (c:cs)
  | predicate c = "" : rest
  | otherwise  = (c : head rest) : tail rest
  where
    rest = splitOnPredicate predicate cs

toInt :: String -> Int
toInt str = read str :: Int

toString :: Int -> String
toString = show

getRanges :: String -> (Int, Int)
getRanges input = case splitOnPredicate ('-' ==) input of
    [a, b] -> (toInt a, toInt b)
    _ -> error "Invalid Range"

findMagicNumbers :: (Int, Int) -> [Int]
findMagicNumbers (start, end) = filter isMagicNumber [start..end]

isMagicNumber :: Int -> Bool
isMagicNumber candidate = 
    let str = show candidate
        len = length str
        -- Try all possible pattern lengths from 1 to len/2
        possiblePatternLengths = [1..(len `div` 2)]
        -- Check if string is made of a pattern repeated at least twice
        isRepeatedPattern patternLen = 
            let (pattern, rest) = splitAt patternLen str
                repeatCount = len `div` patternLen
            in len `mod` patternLen == 0 && 
               concat (replicate repeatCount pattern) == str &&
               repeatCount >= 2
    in any isRepeatedPattern possiblePatternLengths
