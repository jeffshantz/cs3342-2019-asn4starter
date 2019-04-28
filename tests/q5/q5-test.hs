import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

-- Insert your code here

main :: IO ()
main = hspec $ do

  describe "q5: insert" $ do

    it "inserts into an empty list" $ do
      insert 1 [] `shouldBe` [1]

    it "inserts 1 into the list [2]" $ do
      insert 1 [2] `shouldBe` [1,2]

    it "inserts 3 into the list [2]" $ do
      insert 3 [2] `shouldBe` [2,3]

    it "inserts 11 into the list [2,10,12,99]" $ do
      insert 11 [2,10,12,99] `shouldBe` [2,10,11,12,99]

    it "inserts 0 into the list [-10,-5,-1]" $ do
      insert 0 [(-10),(-5),(-1)] `shouldBe` [(-10),(-5),(-1),0]

    it "inserts -11 into the list [-10,-5,-1]" $ do
      insert (-11) [(-10),(-5),(-1)] `shouldBe` [(-11),(-10),(-5),(-1)]

  describe "q5: isort" $ do
    it "sorts an empty list" $ do
      isort ([] :: [Int]) `shouldBe` []
  
    it "sorts a list of size 1" $ do
      isort [1] `shouldBe` [1]

    it "sorts a list of size 2" $ do
      isort [2,1] `shouldBe` [1,2]

    it "sorts a list in descending order" $ do
      isort [50,40,30,20,10,0] `shouldBe` [0,10,20,30,40,50]

    it "sorts a list already in ascending order" $ do
      isort [0,10,20,30,40,50] `shouldBe` [0,10,20,30,40,50]

    it "sorts a list in random order" $ do
      isort [20,0,50,30,40,10] `shouldBe` [0,10,20,30,40,50]

    it "sorts a list containing negatives" $ do
      isort [(-20),20,(-50),50,(-30),30,(-40),40,(-10),0,10] `shouldBe` [(-50),(-40),(-30),(-20),(-10),0,10,20,30,40,50]

