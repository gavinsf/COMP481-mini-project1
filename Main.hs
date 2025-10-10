module Main where

import Transactions
import Filter
import Summary

main :: IO ()
main = do
    let output = filterByCategory "Food" sampleTransactions
    putStrLn "Transactions by category: Food"
    putStrLn (formatTransactions output)

    putStrLn "Average transaction amount by category:"
    let totals = dataByCategory average sampleTransactions
    mapM_ (\(cat, amt) -> putStrLn (cat ++ ": " ++ show amt)) totals