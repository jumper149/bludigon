{-# LANGUAGE RecordWildCards #-}

module Bludigon.Test.RGB (
  test
, Arbitrary_Chromaticity (..)
, Arbitrary_Trichromaticity (..)
) where

import Test.Hspec
import Test.QuickCheck

import Control.DeepSeq
import GHC.Generics

import Bludigon.RGB

test :: Spec
test = describe "Bludigon.RGB" $ do

  it "Chromaticity in bounds." $
    property $ total @Arbitrary_Chromaticity

  it "Trichromaticity in bounds." $
    property $ total @Arbitrary_Trichromaticity

newtype Arbitrary_Chromaticity = Arbitrary_Chromaticity Chromaticity
  deriving (Bounded, Enum, Eq, Generic, Ord, Read, Show)

instance NFData Arbitrary_Chromaticity

instance Arbitrary Arbitrary_Chromaticity where
  arbitrary = elements [minBound .. maxBound]

newtype Arbitrary_Trichromaticity = Arbitrary_Trichromaticity Trichromaticity
  deriving (Bounded, Enum, Eq, Generic, Ord, Read, Show)

instance NFData Arbitrary_Trichromaticity

instance Arbitrary Arbitrary_Trichromaticity where
  arbitrary = elements [minBound .. maxBound]
