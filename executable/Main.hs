module Main ( main
            ) where
import MU

main :: IO ()
main = do
  print $ derivations (from "UUUIII") (from "UU")
  print $ derivations (from "UUUIII") (from "U")
  print $ tree (from "UUUIII") >>= derivations'
