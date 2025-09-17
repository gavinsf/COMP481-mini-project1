module Filter (filterByCategory, filterByMinAmount, filterByYear) where

import Transactions (Transaction(..))

filterByCategory :: String -> [Transaction] -> [Transaction]
filterByCategory category
    | null category = error "Category name cannot be empty."
    | otherwise     = filter (\ transaction -> tCategory transaction == category)

filterByMinAmount :: Double -> [Transaction] -> [Transaction]
filterByMinAmount minAmount = filter (\ transaction -> tAmount transaction >= minAmount)

filterByYear :: String -> [Transaction] -> [Transaction]
filterByYear year = filter (\ transaction -> take 4 (tDate transaction) == year) 