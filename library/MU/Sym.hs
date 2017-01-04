{-# LANGUAGE TypeFamilies #-}
module MU.Sym ( Sym(..)
              , Syms
              ) where

import MU.MU

data Sym
  = M
  | I
  | U
  deriving (Show, Eq, Bounded, Enum)

instance To Sym where
  type ToRep Sym = Char
  to M = 'M'
  to I = 'I'
  to U = 'U'

instance From Sym where
  type FromRep Sym = Char
  from 'M' = M
  from 'I' = I
  from 'U' = U

type Syms = [Sym]

