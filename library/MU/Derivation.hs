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
  derivs' <- derivations' tree'
  return $ filter ((== goal) . drvDerived) derivs'

derivations' :: Tree -> MU Derivations
derivations' (Tree syms subs) = concat <$> go syms subs
  where
    go :: Syms -> [(Rule, MU [Tree])] -> MU [Derivations]
    go _ [] = return []
    go syms' (rule':rules') = do
      let
        initDeriv :: Derivation
        initDeriv = Derivation { drvStart   = syms'
                               , drvSteps   = []
                               , drvDerived = [] }
      h <- withRule syms' rule' initDeriv
      r <- go syms' rules'
      return $ h:r

    withRule :: Syms -> (Rule, MU [Tree]) -> Derivation -> MU Derivations
    withRule syms' (rle, muTrees) deriv = do
      childTrees <- muTrees
      let
        derivs :: Derivations
        derivs = [ Derivation { drvStart = drvStart deriv
                              , drvSteps = Step syms' rle drvDerived':drvSteps deriv
                              , drvDerived = drvDerived'}
                 | (Tree drvDerived' _) <- childTrees ]

        dfsDerivs :: MU [Derivations]
        dfsDerivs = sequence $ do
          chdTree <- childTrees
          let
            dfsDerivs' :: MU Derivations
            dfsDerivs' = do
              dfsDerivs'' <- derivations' chdTree
              let
                fDeriv :: Derivation -> Derivation
                fDeriv d = d { drvStart = drvStart deriv
                             , drvSteps = drvSteps deriv ++ drvSteps d }
              return $ fmap fDeriv dfsDerivs''
          return dfsDerivs'

      dfs' <- dfsDerivs
      return $ concat $ derivs:dfs'
