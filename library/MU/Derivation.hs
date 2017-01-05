{-# LANGUAGE RecordWildCards #-}

module MU.Derivation ( Derivation(..)
                     , Step(..)
                     , derivations
                     , derivations'
                     ) where
import MU.MU
import MU.Sym
import MU.Rule
import MU.Tree

import Control.Monad (join)

data Step = Step
  Syms -- ^ start
  Rule -- ^ applied rule
  Syms -- ^ result
  deriving (Eq)

type Steps = [Step]

instance Show Step where
  show (Step orig rule res) = (show . to) orig
                              ++ " => [" ++ show rule ++ "]"
                              ++ " => " ++ (show . to) res
data Derivation = Derivation { drvStart   :: Syms  -- ^ start
                             , drvSteps   :: Steps -- ^ list of `Step`
                             , drvDerived :: Syms  -- ^ derived symbol
                             }
  deriving (Show, Eq)

type Derivations = [Derivation]

derivations :: Syms -> Syms -> MU Derivations
derivations start goal = do
  tree' <- tree start
  derivs' <- derivations' Nothing tree'
  return $ filter ((== goal) . drvDerived) derivs'

derivations' :: Maybe Derivation -> Tree -> MU Derivations
derivations' mbDeriv (Tree syms subs) = concat <$> go subs
  where
    go :: [(Rule, MU [Tree])] -> MU [Derivations]
    go [] = return []
    go (rule':rules') = do
      h <- withRule syms rule' (maybe
                                 (Derivation { drvStart   = syms
                                             , drvSteps   = []
                                             , drvDerived = [] })
                                 id
                                 mbDeriv)
      r <- go rules'
      return $ h:r

    withRule :: Syms -> (Rule, MU [Tree]) -> Derivation -> MU Derivations
    withRule syms' (rle, muTrees) deriv = do
      childTrees <- muTrees

      let
        derivs :: [(Derivation, Tree)]
        derivs = do
          t@(Tree syms'' _) <- childTrees
          return $ ( Derivation { drvStart   = drvStart deriv
                                , drvSteps   = Step syms' rle syms'':drvSteps deriv
                                , drvDerived = syms'' }
                   , t)
      fmap join $ sequence $ do
        (parent, chdTree) <- derivs
        return $ (parent { drvSteps = reverse $ drvSteps parent } :) <$> derivations' (Just parent) chdTree

