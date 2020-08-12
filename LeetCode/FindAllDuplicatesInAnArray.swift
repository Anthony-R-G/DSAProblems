/*
Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

Find all the elements that appear twice in this array.

Could you do it without extra space and in O(n) runtime?

Example
inputArr = [4,3,2,7,8,2,3,1]
Output = [2,3]
*/

func findDuplicates(_ nums: [Int]) -> [Int] {
  var seenNumbers = Set<Int>()
  var res: [Int] = []

  for num in nums {
    if seenNumbers.contains(num) {
      res.append(num) 
    } else {
      seenNumbers.insert(num)
    }
  }
  return res
}
