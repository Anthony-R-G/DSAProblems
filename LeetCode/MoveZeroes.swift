 /*
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 Must be done in-place.

input = [0,1,0,3,12]
Output = [1,3,12,0,0]
*/

//Approach 1 iterates through the array, with i as the pointer index. When the array at i is equal to 0, then the array will remove the number at index i, but also increment zeroCount by 1. ZeroCount is used to keep track of how many times a 0 was found in the array. 
//Using zeroCount, as long as it's greater than 0, then we will append a 0 to the array for however many times zeroCount was. So if zeroCount was 3, meaning three 0s were found in the array and removed, then we will add three 0s to the end. 

func moveZeroes(_ nums: inout [Int]) {

var i = 0
var zeroCount = 0

while i < nums.count {
  if nums[i] == 0 {
    zeroCount += 1
    nums.remove(at: i)
    continue
  }
  i += 1
}

if zeroCount > 0 {
for _ in 0...zeroCount - 1 {
  nums.append(0)
   }
 }
}


//Approach 2 uses two pointers. Pointer j will be iterating through the entire array and the while loop will end when j reaches nums.count - 1. 
//Pointer j iterates +1 regardless of whether a 0 was found or not, so as to go through the entire array.
//Pointer i will start at index 0, and see if the array at index i is equal to 0. If it is, it will remove the array at that index, and also append a new 0 to the end. 
//If the index at i is NOT equal to 0, then i will simply increment by 1 so it can look at the next index. 
func moveZeroes2(_ nums: inout [Int]) {

  var i = 0
  var j = 0
  
  while j < nums.count {
    if nums[i] == 0 {
      nums.remove(at: i)
      nums.append(0)
      j += 1
      continue
    }
    i += 1
    j += 1
  }
}
