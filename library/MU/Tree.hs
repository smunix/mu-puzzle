module MU.Tree ( Tree(..)
               , Trees
               , SubTree
               , SubTrees
               , tree
               ) where

import MU.MU
import MU.Sym
import MU.Rule
import MU.Apply

data Tree     = Tree Syms SubTrees deriving (Show)
type Trees    = [Tree]
type SubTree  = (Rule, MU [Tree])
type SubTrees = [SubTree]

tree :: Syms -> MU Tree
tree syms = return $ Tree syms subtrees
  where
    subtrees :: SubTrees
    subtrees = do
      rle <- rules
      let
        muSyms :: MU [Syms]
        muSyms = apply rle syms

        muTrees :: MU [Tree]
        muTrees = flatten $ fmap (fmap tree) muSyms

      return (rle, muTrees)
