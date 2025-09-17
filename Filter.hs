module Filter (filterByCategory, filterByMinAmount) where

import Transactions (Transaction(..))
import Text.Read (readMaybe)

filterByCategory :: String -> [Transaction] -> [Transaction]
filterByCategory category transactions
    | null category = error "Category name cannot be empty."
    | otherwise     = filter (\ transaction -> tCategory transaction == category) transactions

filterByMinAmount :: Double -> [Transaction] -> [Transaction]
filterByMinAmount minAmount = filter (\ transaction -> tAmount transaction >= minAmount) 