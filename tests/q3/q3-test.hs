import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

-- Insert your code here

main :: IO ()
main = hspec $ do

  describe "q3: pow'" $ do
  
    it "correctly evaluates 2^16" $ do
      pow' 2 16 `shouldBe` 65536

    it "correctly evaluates 2^1" $ do
      pow' 2 1 `shouldBe` 2

    it "correctly evaluates 2^0" $ do
      pow' 2 0 `shouldBe` 1

    it "correctly evaluates (-2)^6" $ do
      pow' (-2) 6 `shouldBe` 64

    it "correctly evaluates (-2)^7" $ do
      pow' (-2) 7 `shouldBe` (-128)
   
    it "correctly evaluates 2^64" $ do
      pow' 2 64 `shouldBe` 18446744073709551616
   
