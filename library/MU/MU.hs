{-# LANGUAGE GeneralizedNewtypeDeriving, DefaultSignatures, MultiParamTypeClasses, FlexibleInstances, TypeFamilies #-}

module MU.MU ( MU
             , Flatten(..)
             , To (..)
             , From (..)
             ) where

import Control.Monad.Identity
newtype MU a = MU (Identity a) deriving (Functor, Applicative, Monad, Show)

-- | flatten MU traversable list of MUs
class Flatten m t a where
  flatten :: m (t (m a)) -> m (t a)
  default flatten :: (Monad m, Traversable t) => m (t (m a)) -> m (t a)
  flatten = (=<<) (join . return . sequence)

instance Flatten MU [] a

-- | To Conversion helper
class To a where
  type ToRep a :: *
  to :: a -> ToRep a

instance (Functor f, To a) => To (f a) where
  type ToRep (f a) = f (ToRep a)
  to = fmap to

-- | From Conversion helper
class From a where
  type FromRep a :: *
  from :: FromRep a -> a

instance (Traversable t, From a) => From (t a) where
  type FromRep (t a) = t (FromRep a)
  from = fmap from
