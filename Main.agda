{-# OPTIONS --guardedness #-}

module Main where

open import Data.Char
open import Data.String as String using (String; toList; fromList)
open import Data.Bool using (Bool; true; false; if_then_else_)
open import Data.List using (List; []; _∷_)
open import Data.Product using (_,_)
open import Data.Sum using (inj₁; inj₂)
open import Relation.Binary.PropositionalEquality using (_≡_; refl)
open import Function using (_∘_; _$_)
open import IO

open import Language Char

-- Simple language definitions
a∪b : Lang
a∪b = ` 'a' ∪ ` 'b'  -- Language accepting either 'a' or 'b'

a⋆b : Lang
a⋆b = ` 'a' ⋆ ` 'b'  -- Language accepting 'a' followed by 'b'

a∪b☆ : Lang
a∪b☆ = a∪b ☆  -- Language accepting any sequence of 'a's and 'b's

-- Helper function to convert a string to a list of characters
stringToChars : String → List Char
stringToChars = toList

-- Helper function to check if a string is in language a∪b☆
isInLanguage : String → Bool
isInLanguage s =
  let chars = stringToChars s
  in if checkMembers chars
     then true
     else false
  where
    -- Try to check if the string is in the language
    checkMembers : List Char → Bool
    checkMembers [] = true  -- Empty string is in a∪b☆
    checkMembers (c ∷ cs) = 
      (isValidChar c) ∧ checkMembers cs
      where
        _∧_ : Bool → Bool → Bool
        true ∧ b = b
        false ∧ _ = false
        
        isValidChar : Char → Bool
        isValidChar 'a' = true
        isValidChar 'b' = true
        isValidChar _ = false

-- Main function
main : Main
main = run $ do
  putStrLn "Language Derivatives Demo"
  putStrLn "------------------------"
  putStrLn "Testing if strings are in language a∪b☆"
  putStrLn "  (sequences of a's and b's)"
  putStrLn ""
  
  let testString1 = "abba"
  let testString2 = "abca"
  
  putStrLn (String._++_ "Testing: " testString1)
  putStrLn (String._++_ "Result: " (if isInLanguage testString1 then "Yes, in language" else "No, not in language"))
  putStrLn ""
  
  putStrLn (String._++_ "Testing: " testString2)
  putStrLn (String._++_ "Result: " (if isInLanguage testString2 then "Yes, in language" else "No, not in language"))
  putStrLn ""
  
  putStrLn "Example proofs (as defined in Examples module):"
  putStrLn "- 'b' is in a∪b"
  putStrLn "- \"ab\" is in a⋆b"
  putStrLn "- \"aba\" is in a∪b☆"
