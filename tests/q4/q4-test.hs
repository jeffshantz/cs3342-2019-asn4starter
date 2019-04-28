import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

-- Insert your code here

main :: IO ()
main = hspec $ do

  describe "q4: list comprehensions" $ do

    it "correctly defines odds" $ do
      odds `shouldBe` [1,3,5,7,9]

    it "correctly defines positiveEvens" $ do
      take 5 positiveEvens `shouldBe` [2,4,6,8,10]

    it "defines positiveEvens as an infinite list" $ do
      take 5 (drop 499 positiveEvens) `shouldBe` [1000,1002,1004,1006,1008]

    it "correctly defines powersOfTwo" $ do
      take 5 powersOfTwo `shouldBe` [1,2,4,8,16]

    it "defines powersOfTwo as an infinite list" $ do
      take 5 (drop 10 powersOfTwo) `shouldBe` [1024,2048,4096,8192,16384]

    it "returns the correct value for firstNPrimes 5" $ do
      firstNPrimes 5 `shouldBe` [2,3,5,7,11]
   
    it "returns the correct value for firstNPrimes 20" $ do
      drop 15 (firstNPrimes 20) `shouldBe` [53,59,61,67,71]

