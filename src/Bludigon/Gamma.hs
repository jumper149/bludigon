module Bludigon.Gamma (
  MonadGamma (..)
) where

import Bludigon.RGB

class Monad m => MonadGamma m where

  {- | Calculate a 'Trichromaticity'.
     This is a monadic function, to allow the value to be dependent on side effects like time and
     location.
  -}
  gamma :: m Trichromaticity
