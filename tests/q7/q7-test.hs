import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

-- Insert your code here

main :: IO ()
main = hspec $ do

  describe "q7: l33t" $ do
    it "returns the correct result for an empty string" $ do
      l33t "" `shouldBe` ""

    it "translates consonants to uppercase" $ do
      l33t "bcdfg" `shouldBe` "BCDFG"

    it "leaves uppercase consonants alone" $ do
      l33t "BCdfG" `shouldBe` "BCDFG"

    it "translates e and E to the number 3" $ do
      l33t "eE" `shouldBe` "33"

    it "translates i and I to the number 1" $ do
      l33t "iI" `shouldBe` "11"

    it "translates all other vowels to lowercase" $ do
      l33t "AOU" `shouldBe` "aou"

    it "leaves all other lowercase vowels alone" $ do
      l33t "aOu" `shouldBe` "aou"
 
    it "translates ! to !!!111oneone" $ do
      l33t "!" `shouldBe` "!!!111oneone"

    it "leaves all other characters alone" $ do
      l33t "1234@#$" `shouldBe` "1234@#$"

    it "correctly translates the string 'hi'" $ do
      l33t "hi" `shouldBe` "H1"

    it "correctly translates the string 'hi!'" $ do
      l33t "hi!" `shouldBe` "H1!!!111oneone"

    it "correctly translates the string 'hEllO, worLd'" $ do
      l33t "hEllO, worLd" `shouldBe` "H3LLo, WoRLD"

