/*
Given an array of integers, return indices of the two numbers such that they add up to a specific target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
Example:
Given nums = [2, 7, 11, 15], target = 9,
Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
*/

//O(n) runtime complexity
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numPairs : [Int : Int ] = [:]
        
        for i in 0..<nums.count {
            if let sumPairNumIndex = numPairs[(target - nums[i])] {
                return ([sumPairNumIndex, i])
            } else {
                numPairs[(nums[i])] = i
            } 
        }
        return [Int]()
    }


//Alternative Approach (makes assumption that array is sorted)
func altTwoSum(_ nums: [Int], target: Int) -> [Int] {
  let lowPointer = 0
  var highPointer = nums.count - 1
  var res = [Int]()

  while lowPointer < highPointer {
    if nums[lowPointer] + nums[highPointer] == target {
      res.append(lowPointer)
      res.append(highPointer)
    }
    highPointer -= 1
  }
  return res
}
