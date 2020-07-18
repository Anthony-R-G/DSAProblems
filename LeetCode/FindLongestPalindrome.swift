/*
Given a string which consists of lowercase or uppercase letters, find the length of the longest palindromes that can be built with those letters.
This is case sensitive, for example "Aa" is not considered a palindrome here.

Input example = "abccccdd"
Output = 7
Explanation:
One longest palindrome that can be built is "dccaccd", whose length is 7.
*/

func longestPalindromeV2(_ s: String) -> Int {
  //Creating Hashmap
  var countDict: [Character:Int] = [:]
  s.forEach { countDict[$0] = (countDict[$0, default: 0] + 1) }

  //Scan Hashmap for Pairs
  var totalPairs = 0
  var hasOdd = false

  for val in countDict.values {
    let pairs = val.roundDown()
    if !hasOdd && val - (pairs * 2) >= 1 {
      hasOdd = true
    }
    totalPairs += pairs
  } 

  return totalPairs * 2 + (hasOdd ? 1 : 0)
}
