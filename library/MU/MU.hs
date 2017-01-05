{-# LANGUAGE GeneralizedNewtypeDeriving, DefaultSignatures, MultiParamTypeClasses, FlexibleInstances, TypeFamilies #-}

module MU.MU ( MUT(..)
             , MU
             , Flatten(..)
             , To (..)
             , From (..)
             , lift
             ) where

import Control.Applicative
import Control.Monad.Identity
import Control.Monad.Trans

newtype MUT m a = MUT { unMUT :: m a } deriving (Functor, Applicative, Monad)
type MU = MUT Identity

instance MonadTrans MUT where
  lift = MUT

instance (Show (m a)) => Show (MUT m a) where
  show (MUT m) = show m

instance (Monad m, Alternative m) => Alternative (MUT m) where
  empty = lift empty
  (MUT a1) <|> (MUT a2) = MUT (a1 <|> a2)

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
