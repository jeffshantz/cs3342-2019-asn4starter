import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

-- Insert your code here

main :: IO ()
main = hspec $ do

  describe "q8: hexStrToDec" $ do

    it "converts 'a' to 10" $ do
      hexStrToDec "a" `shouldBe` 10

    it "converts 'cd' to 205" $ do
      hexStrToDec "cd" `shouldBe` 205
    
    it "converts 'abc' to 2748" $ do
      hexStrToDec "abc" `shouldBe` 2748

    it "converts 'DEF' to 3567" $ do
      hexStrToDec "DEF" `shouldBe` 3567

    it "converts 'DeaD' to 57005" $ do
      hexStrToDec "DeaD" `shouldBe` 57005

    it "converts 'deadCAFEd00d' to 244838016405517" $ do
      hexStrToDec "deadCAFEd00d" `shouldBe` 244838016405517

    it "converts '0xCaFe' to 51966" $ do
      hexStrToDec "0xCaFe" `shouldBe` 51966

    it "converts '0XBeEf' to 48879" $ do
      hexStrToDec "0XBeEf" `shouldBe` 48879

    it "converts '000010' to 16" $ do
      hexStrToDec "000010" `shouldBe` 16

    it "converts '0x000AF' to 175" $ do
      hexStrToDec "0x000AF" `shouldBe` 175

    it "raises the correct error on 'AABBZBBA'" $ do
      evaluate (hexStrToDec "AABBZBBA") `shouldThrow` errorCall "Non-hexadecimal digits present"

    it "raises the correct error on '0x110x11'" $ do
      evaluate (hexStrToDec "0x110x11") `shouldThrow` errorCall "Non-hexadecimal digits present"

