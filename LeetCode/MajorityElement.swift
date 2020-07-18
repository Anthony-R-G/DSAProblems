/*

Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.

Example 1:

Input: [3,2,3]
Output: 3

*/

func majorityElement(_ nums: [Int]) -> Int {
  var counts: [ Int : Int] = [:]
  for num in nums {
    counts[num] = counts[num, default: 0 ] + 1

    if counts[num]! > (nums.count / 2) {
      return num
    }
  }
  return 0
}
