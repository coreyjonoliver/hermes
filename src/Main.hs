module Main where

import Hermes
import System.Random  

data DayOfWeek
     = Monday
     | Tuesday
     | Wednesday
     | Thursday
     | Friday
     | Saturday
     | Sunday
     deriving (Show, Read, Eq, Enum, Ord, Bounded)

instance Random DayOfWeek where
    random g = case randomR (fromEnum (minBound :: DayOfWeek), fromEnum (maxBound :: DayOfWeek)) g of
                 (r, g') -> (toEnum r, g')
    randomR (a,b) g = case randomR (fromEnum a, fromEnum b) g of
                        (r, g') -> (toEnum r, g')

main :: IO ()
main = do
  gen <- newStdGen
  let ns = randoms gen :: [DayOfWeek]
  print $ take 10 ns
