/*
Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

let input = [73, 74, 75, 71, 69, 72, 76, 73]

Output should be [1, 1, 4, 2, 1, 1, 0, 0].

*/

func dailyTemperatures(_ T: [Int]) -> [Int] {
  var stack: [Int] = []
  var res = Array.init(repeating: 0, count: T.count)

  for i in 0..<T.count {
    while !stack.isEmpty && T[i] > T[stack.last!] {
      res[stack.last!] = (i - stack.popLast()!)      
    }
    stack.append(i)
  }

  return res
}
