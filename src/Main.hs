module Main where

import Hermes
import System.Random  
import Control.Monad.Random

data Orientation 
     = Backward
     | Forward
     | Vertical
     | Horizontal
     deriving (Show, Read, Eq, Enum, Ord, Bounded)

instance Random Orientation where
    random g = case randomR (fromEnum (minBound :: Orientation), fromEnum (maxBound :: Orientation)) g of
                 (r, g') -> (toEnum r, g')
    randomR (a,b) g = case randomR (fromEnum a, fromEnum b) g of
                        (r, g') -> (toEnum r, g')

randomOrientation :: Rand StdGen Orientation
randomOrientation = getRandom

main :: IO ()
main = do
  g <- getStdGen
  let r = evalRand randomOrientation g
  print r
