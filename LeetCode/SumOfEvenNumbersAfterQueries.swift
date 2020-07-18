/*
We have an array A of integers, and an array queries of queries.

For the i-th query val = queries[i][0], index = queries[i][1], we add val to A[index].  Then, the answer to the i-th query is the sum of the even values of A.

(Here, the given index = queries[i][1] is a 0-based index, and each query permanently modifies the array A.)

Return the answer to all queries.  Your answer array should have answer[i] as the answer to the i-th query.

example:
let A = [1,2,3,4]
let queries = [[1,0],[-3,1],[-4,0],[2,3]]
Output = [8,6,2,4]
*/

func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
  var A = A
  var sumOfEven = A.filter {$0 % 2 == 0}.reduce(0, +)
  var resultArr = [Int]()


  for i in 0..<A.count {
    let indexToManipulate = queries[i][1]
    let valueToAdd = queries[i][0]
    let originalVal = A[indexToManipulate]
    let newVal = originalVal + valueToAdd

    if originalVal % 2 == 0 {
      sumOfEven -= originalVal
    }

    if newVal % 2 == 0 {
      sumOfEven += newVal
    }

    A[indexToManipulate] = newVal  
    resultArr.append(sumOfEven)
  }
  return resultArr
}

