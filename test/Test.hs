module Test where

import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2 (testProperty)

import Test.QuickCheck
import Test.HUnit

import Hermes

prop_saysHermes str =
  (length str < 6) ==> (length hermes > length str)
  where types = (str :: String)

case_saysHermes = hermes @?= "Hermes!"

tests = [
  testGroup "Hermes Props" [
    testProperty "says hermes" prop_saysHermes
    ],
  testGroup "Hermes Tests" [
    testCase "says hermes" case_saysHermes
    ]
  ]

-- convenient whilst in ghci
runTests = defaultMain tests
