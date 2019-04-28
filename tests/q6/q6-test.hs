import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

-- Insert your code here

main :: IO ()
main = hspec $ do

  describe "q6: merge" $ do
    it "merges two empty lists" $ do
      merge ([] :: [Int]) ([] :: [Int]) `shouldBe` []

    it "merges an empty list and a non-empty list" $ do
      merge ([] :: [Int]) [1,2,3] `shouldBe` [1,2,3]

    it "merges a non-empty list and an empty list" $ do
      merge [1,2,3] ([] :: [Int]) `shouldBe` [1,2,3]

    it "merges two lists of size 1" $ do
      merge [1] [2] `shouldBe` [1,2]

    it "merges two lists of size 1 (reverse operands)" $ do
      merge [2] [1] `shouldBe` [1,2]

    it "merges two lists of sizes 3 and 2" $ do
      merge [4,7,9] [2,5] `shouldBe` [2,4,5,7,9]

    it "merges two lists of sizes 2 and 3" $ do
      merge [2,5] [4,7,9] `shouldBe` [2,4,5,7,9]

    it "merges lists containing negative numbers" $ do
      merge [(-10),(-5),0,5,10] [(-20),(-10),(-2),1,2,10,20] `shouldBe` [(-20),(-10),(-10),(-5),(-2),0,1,2,5,10,10,20]

  describe "q6: msort" $ do
    it "sorts an empty list" $ do
      msort ([] :: [Int]) `shouldBe` []
  
    it "sorts a list of size 1" $ do
      msort [1] `shouldBe` [1]

    it "sorts a list of size 2" $ do
      msort [2,1] `shouldBe` [1,2]

    it "sorts a list in descending order" $ do
      msort [50,40,30,20,10,0] `shouldBe` [0,10,20,30,40,50]

    it "sorts a list already in ascending order" $ do
      msort [0,10,20,30,40,50] `shouldBe` [0,10,20,30,40,50]

    it "sorts a list in random order" $ do
      msort [20,0,50,30,40,10] `shouldBe` [0,10,20,30,40,50]

    it "sorts a list containing negatives" $ do
      msort [(-20),20,(-50),50,(-30),30,(-40),40,(-10),0,10] `shouldBe` [(-50),(-40),(-30),(-20),(-10),0,10,20,30,40,50]

