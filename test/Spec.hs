module Main where

import Lib
import Test.HUnit

tests =
  test
      -- myLast
    [ "P1" ~: Nothing ~=? myLast ""
    , "P1" ~: Just 1 ~=? myLast [1]
    , "P1" ~: Just 2 ~=? myLast [1, 2]
    , "P1" ~: Just 'z' ~=? myLast ['x', 'y', 'z']
    -- myButLast
    , "P2" ~: Nothing ~=? myButLast ""
    , "P2" ~: Nothing ~=? myButLast [1]
    , "P2" ~: Just 1 ~=? myButLast [1, 2]
    , "P2" ~: Just 2 ~=? myButLast [1, 2, 3]
    -- myElementAt
    , "P3" ~: Nothing ~=? myElementAt "" 1
    , "P3" ~: Nothing ~=? myElementAt [1] (-1)
    , "P3" ~: Nothing ~=? myElementAt [1] 0
    , "P3" ~: Just 1 ~=? myElementAt [1] 1
    , "P3" ~: Nothing ~=? myElementAt [1] 2
    , "P3" ~: Just 2 ~=? myElementAt [1, 2] 2
    , "P3" ~: Nothing ~=? myElementAt [1, 2] 3
    -- myLength
    , "P4" ~: 0 ~=? myLength []
    , "P4" ~: 1 ~=? myLength [1]
    , "P4" ~: 2 ~=? myLength [1, 2]
    -- myReverse
    , "P5" ~: ([] :: [Int]) ~=? myReverse []
    , "P5" ~: [1] ~=? myReverse [1]
    , "P5" ~: [2, 1] ~=? myReverse [1, 2]
    , "P5" ~: [3, 2, 1] ~=? myReverse [1, 2, 3]
    , "P5" ~: "!amanap ,lanac a ,nalp a ,nam A" ~=?
      myReverse "A man, a plan, a canal, panama!"
    -- myIsPalindrome
    , "P6" ~: False ~=? myIsPalindrome [1, 2, 3]
    , "P6" ~: True ~=? myIsPalindrome [1, 2, 1]
    , "P6" ~: True ~=? myIsPalindrome "AsDfDsA"
    , "P6" ~: False ~=? myIsPalindrome "macadamize"
    -- myFlatten
    , "P7" ~: [1] ~=? myFlatten (Elem 1)
    , "P7" ~: ([] :: [Int]) ~=? myFlatten (List [])
    , "P7" ~: [1, 2, 3, 4, 5] ~=?
      myFlatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
    -- myCompress
    , "P8" ~: "" ~=? myCompress ""
    , "P8" ~: [1] ~=? myCompress [1]
    , "P8" ~: [1, 2] ~=? myCompress [1, 2]
    , "P8" ~: [1, 2] ~=? myCompress [1, 2, 2]
    , "P8" ~: "helo" ~=? myCompress "hello"
    -- myPack
    , "P9" ~: [] ~=? myPack ""
    , "P9" ~: ["aa", "b", "c"] ~=? myPack "aabc"
    , "P9" ~: [[1, 1, 1, 1], [2], [3, 3], [1, 1]] ~=?
      myPack [1, 1, 1, 1, 2, 3, 3, 1, 1]
    -- myEncode
    , "P10" ~: [] ~=? myEncode ""
    , "P10" ~: [(4, 'a'), (1, 'b'), (2, 'c'), (2, 'a')] ~=? myEncode "aaaabccaa"
    -- myEncodeModified
    , "P11" ~: [] ~=? myEncode ""
    , "P11" ~:
      [ Multiple 4 'a'
      , Single 'b'
      , Multiple 2 'c'
      , Multiple 2 'a'
      , Single 'd'
      , Multiple 4 'e'
      ] ~=?
      myEncodeModified "aaaabccaadeeee"
    -- myDecodeModified
    , "P12" ~: "" ~=? myDecodeModified []
    , "P12" ~: "aaabbcaa" ~=?
      myDecodeModified [Multiple 3 'a', Multiple 2 'b', Single 'c', Multiple 2 'a']
    -- myEncodeDirect
    , "P13" ~:
      [ Multiple 4 'a'
      , Single 'b'
      , Multiple 2 'c'
      , Multiple 2 'a'
      , Single 'd'
      , Multiple 4 'e'
      ] ~=?
      myEncodeDirect "aaaabccaadeeee"
    ]

main :: IO Counts
main = runTestTT tests
