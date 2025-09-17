module Filter (filterByCategory, filterByMinAmount, filterByYear,
               filterByMonth) where

import Transactions (Transaction(..))

filterByCategory :: String -> [Transaction] -> [Transaction]
filterByCategory category
    | null category = error "Category name cannot be empty."
    | otherwise     = filter (\ transaction -> tCategory transaction == category)

filterByMinAmount :: Double -> [Transaction] -> [Transaction]
filterByMinAmount minAmount = filter (\ transaction -> tAmount transaction >= minAmount)

filterByYear :: String -> [Transaction] -> [Transaction]
filterByYear year = filter (\ transaction -> take 4 (tDate transaction) == year)

filterByMonth :: String -> [Transaction] -> [Transaction]
filterByMonth month = filter (\ transaction -> take 2 (drop 5 (tDate transaction)) == month)