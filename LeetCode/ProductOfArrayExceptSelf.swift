/*
Given an array nums of n integers where n > 1, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

Example:

Input:  [1,2,3,4]
Output: [24,12,8,6]
Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

Note: Please solve it without division and in O(n).

Follow up:
Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
*/

func productExceptSelfV1(_ nums: [Int]) -> [Int] {
  
  var indexToIgnore = 0
  var res = [Int]()

  while res.count < nums.count {
    var currentProduct = 1
    for i in 0..<nums.count {
      guard i != indexToIgnore else { continue }
      currentProduct *= nums[i]
    }
    res.append(currentProduct)
    indexToIgnore += 1
  }
  return res
}


func productExceptSelfV2(_ nums: [Int]) -> [Int] {
  var res = [Int]()
  var maxNonZeroProduct = 1
  var hasMultipleZeroes = Bool()
  var hasZero = Bool()

  for i in 0..<nums.count {
    if nums[i] == 0 {
      if hasZero == false {
        hasZero = true
      } else {
        hasMultipleZeroes = true
      }
      continue
    } 
    maxNonZeroProduct *= nums[i]
  }

  for i in 0..<nums.count {
    guard nums[i] != 0 else {
      if hasMultipleZeroes == true {
        res.append(0)
      } else {
        res.append(maxNonZeroProduct)
      }
      continue
    }
    res.append(hasZero ? 0 : maxNonZeroProduct * 1/nums[i])
    }

  return res
}


func productExceptSelfV3(_ nums: [Int]) -> [Int] {
  var leftArr = Array(repeating: 1, count: nums.count)
  var rightArr = Array(repeating: 1, count: nums.count)
  var res = [Int]()

  //Constructing Left Array
  for i in 1..<nums.count {
    leftArr[i] = nums[i - 1] * leftArr[i - 1]
  }

  //Constructing Right Array
  for i in stride(from: nums.count - 2, to: -1, by: -1 ) {
    rightArr[i] = nums[i + 1] * rightArr[i + 1]
  }

  //Constructing Result Array
  for i in 0..<nums.count {
    res.append(leftArr[i] * rightArr[i])
  }
  return res
}
