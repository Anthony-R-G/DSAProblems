/*
Given two sorted arrays, merge the two arrays into one bigger array that is still sorted.

let arr1 = [0,3,4,27,29,31]
let arr2 = [4,6,30]
Output = [0,3,4,4,6,27,29,30,31]
*/



//Approach 1 simply adds each element of the individual arrays into one larger array, then uses a basic bubble sort. In this case, the time-complexity would be O(n^2) bc the sorting algorithm used is the botleneck. Could be improved if putting each element into a heap, and using a heapsort. But even then, that would be O(n log n) and isn't ideal, considering the individual arrays are already sorted. 
func mergeSortedArrays1(arr1: [Int], arr2: [Int]) -> [Int] {
  var combinedArr = [Int]()

  for num in arr1 {
    combinedArr.append(num)
  } 

  for num in arr2 {
    combinedArr.append(num)
  }

  for i in stride(from: combinedArr.count - 1, to: 0, by: -1) {
    for j in 1...i {
      if combinedArr[j] < combinedArr[j-1] {
        let tmp = combinedArr[j-1]
        combinedArr[j-1] = combinedArr[j]
        combinedArr[j] = tmp
      }
    }
  }
  return combinedArr
}

print(mergeSortedArrays1(arr1: arr1, arr2: arr2))

//Approach 2 uses two pointers. One will access 1 at i, and the other will access array 2 at j. A comparison for arr1[i] will be made vs arr2[j] and whichever is smaller will be added to the array, and the respective i/j value will be incremented and compared again.
//Note, the smaller array is the cap. While in the first loop, if you reach the end of the smaller array, then will still be elements in the larger array that have yet to get added. This is because, on the final iteration, i/j (whichever is smaller) < arr.count no longer becomes true, and the loop just stops, even though the other array still has more elements.
//To fix this, do two separate while loops, one for j and one for i. This will add any remaining elements, which would be in sorted order.
//Time-complexity is O(n)

func mergeSortedArrays2(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
  
  var i = 0
  var j = 0
  var mergedArr = [Int]()

  while i < arr1.count && j < arr2.count {
    if arr1[i] < arr2[j] {
      mergedArr.append(arr1[i])
      i += 1
    } else {
      mergedArr.append(arr2[j])
      j += 1
    }
  }

  while i < arr1.count {
    mergedArr.append(arr1[i])
    i += 1
  }

  while j < arr2.count {
    mergedArr.append(arr2[j])
    j += 1
  }

  return mergedArr
}
