module Main where

import Transactions
import Filter

main :: IO ()
main = do
     let output = filterByCategory "Food" sampleTransactions
     print output
     