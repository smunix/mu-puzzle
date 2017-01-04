{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module MU.Apply ( apply
                ) where

import MU.MU
import MU.Sym
import MU.Rule

import Data.List (tails, isPrefixOf)
import Control.Monad.Identity

-- | split xs => [(xs1, xs2) | xs1 ++ xs2 == xs]
splits :: Syms -> MU [(Syms, Syms)]
splits xs = return $ zip (fmap (flip take xs) [0..]) (tails xs)

substitute :: Syms -> Syms -> Syms -> MU [Syms]
substitute old new xs = do
  sxs <- splits xs
  let
    ret :: [Syms]
    ret = do
      (ixs, txs) <- sxs
      guard $ old `isPrefixOf` txs
      return $ ixs ++ new ++ (drop (length old) txs)

  return ret

-- | https://en.wikipedia.org/wiki/MU_puzzle
apply :: Rule -> Syms -> MU [Syms]
apply _ [] = return []
apply R1 xs
  | last xs == I = return $ [xs ++ [U]]
apply R2 ixs@(M:xs) = return $ [ixs++xs]
apply R3 xs = substitute [I,I,I] [U] xs
apply R4 xs = substitute [U,U] [] xs
apply _ _ = return []
