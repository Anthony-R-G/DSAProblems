/*
Given a non-empty list of words, return the k most frequent elements.

Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
Output: ["i", "love"]

Explanation: "i" and "love" are the two most frequent words.
    Note that "i" comes before "love" due to a lower alphabetical order.

*/

//Time: O(n log n) 
//Space O(n)
func bruteTopKFrequent(_ words: [String], _ k: Int) -> [String] {
  var countsDict: [String: Int] = [:]

  words.forEach { countsDict[$0] = countsDict[$0, default: 0] + 1 }

  let sortedByCount = countsDict.sorted(by: {
    if $0.1 == $1.1 {
      return $0.0 < $1.0
    } else {
      return $0.1 > $1.1
    }
  }).prefix(k).map{$0.0}
  
  return sortedByCount
}
