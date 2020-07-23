/*
Write a function that accepts an array of integers as input, and returns the second-largest value in that array.

[1, 2, 3, 3] -> 3
[0, 1, 2, 3] -> 2
[-1, -2, -3] -> -2

*/

func findSecondHighestVal(_ nums: [Int] ) -> Int {
  var maxVal = Int.min
  var secondHighestVal = Int.min

  //Find max
  for i in 0..<nums.count {
    if nums[i] > maxVal.0 {
      maxVal = nums[i]
      secondHighestVal = nums[i]
      continue
    }

    if nums[i] > secondHighestVal {
      secondHighestVal = nums[i]
    }
  }
  return secondHighestVal
}
