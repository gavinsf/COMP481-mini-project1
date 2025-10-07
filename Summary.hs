module Summary (average, maxOfList, 
minOfList, proportionByCategory, dataByCategory) where

import Data.List (sortBy, groupBy)
import Data.Ord (comparing)
import Transactions

--helper functions
average :: [Double] -> Double
average xs = sum xs / fromIntegral (length xs)

maxOfList :: [Double] -> Double
maxOfList [] = error "Empty list"
maxOfList (x:xs) = foldr max x xs

minOfList :: [Double] -> Double
minOfList [] = error "Empty list"
minOfList (x:xs) = foldr min x xs


-- proportion of total sales per category
proportionByCategory :: [Transaction]-> [(String, Double)]
proportionByCategory txs = 
  let groups = groupBy (\a b -> tCategory a == tCategory b) (sortBy(comparing tCategory) txs)
  in map (\group -> (tCategory (head group), fromIntegral (length group) / fromIntegral (length txs))) groups

-- data by category, takes any of the helper functions as input
-- for totalByCategory behavior input sum to the function
dataByCategory :: ([Double] -> Double) -> [Transaction] -> [(String, Double)]
dataByCategory f txs =
  let groups = groupBy (\a b -> tCategory a == tCategory b) (sortBy(comparing tCategory) txs)
  in map (\group -> (tCategory (head group), f (map tAmount group))) groups
 