import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

-- Insert your code here

main :: IO ()
main = hspec $ do

  describe "q1: mult" $ do

    it "correctly evaluates 7 x 5" $ do
      mult 7 5 `shouldBe` 35

    it "is commutative (5 x 7)" $ do
      mult 5 7 `shouldBe` 35

    it "correctly evalutes 5 x 1" $ do
      mult 5 1 `shouldBe` 5

    it "correctly evaluates 5 x 0" $ do
      mult 5 0 `shouldBe` 0

    it "correctly evaluates 0 x 5" $ do
      mult 0 5 `shouldBe` 0

    it "correctly evaluates 18446744073709551616 x 10" $ do
      mult 18446744073709551616 10 `shouldBe` 184467440737095516160
