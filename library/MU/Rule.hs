{-# LANGUAGE TypeFamilies #-}
module MU.Rule ( Rule(..)
               , rules
               ) where

import MU.MU

-- https://en.wikipedia.org/wiki/MU_puzzle

data Rule
  = R1 -- ^ xI    →    xIU
  | R2 -- ^ Mx    →    Mxx
  | R3 -- ^ xIIIy →    xUy
  | R4 -- ^ xUUy  →    xy
  deriving (Eq, Enum, Bounded)

instance To Rule where
  type ToRep Rule = Int
  to = (+1) . fromEnum

instance From Rule where
  type FromRep Rule = Int
  from = toEnum . (flip (-) 1)

instance Show Rule where
  show R1 = "xI → xIU"
  show R2 = "Mx → Mxx"
  show R3 = "xIIIy → xUy"
  show R4 = "xUUy  → xy"

rules :: [Rule]
rules = enumFromTo minBound maxBound
