{-# LANGUAGE RecordWildCards #-}

module Transactions (sampleTransactions, formatTransactions, Transaction(..)) where

import Data.Function (on)
import Text.Printf (printf)


-- Transaction type and sample data
data Transaction = Transaction
  { tDate     :: String
  , tCategory :: String
  , tAmount   :: Double
  , tNote     :: String
  } deriving (Show, Eq)

sampleTransactions :: [Transaction]
sampleTransactions =
  [ Transaction "2024-03-01" "Food"   12.50 "Lunch at cafe"
  , Transaction "2024-03-02" "Travel" 120.00 "Taxi and train"
  , Transaction "2024-03-04" "Food"   7.80 "Coffee"
  , Transaction "2024-03-05" "Bills"  60.00 "Phone bill"
  , Transaction "2024-03-06" "Travel" 45.00 "Bus tickets"
  , Transaction "2024-03-07" "Food"   25.00 "Dinner with friends"
  ]

-- Format results as a Table  
formatTransactions :: [Transaction] -> String
formatTransactions txs =
  let header    = printf "%-12s   %-12s   %8s   %s" "Date" "Category" "Amount" "Note"
      formatRow t = printf "%-12s | %-12s | %8.2f | %s"
                        (tDate t) (tCategory t) (tAmount t) (tNote t)
  in unlines (header : map formatRow txs)
