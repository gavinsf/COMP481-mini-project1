module Filter (filterByCategory) where

import Transactions (Transaction(..))

filterByCategory :: String -> [Transaction] -> [Transaction]
filterByCategory category transactions
    | null category = error "Category name cannot be empty"
    | otherwise     = filter (\transaction -> tCategory transaction == category) transactions