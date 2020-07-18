/*
The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

F(0) = 0,   F(1) = 1
F(N) = F(N - 1) + F(N - 2), for N > 1.
Given N, calculate F(N).
*/

//note: Without dynamic programming, this recursive approach is O(2^n) runtime complexity
func fibonacciRecursive(_ n: Int) -> Int { 
  if n < 2 { return n }
  
  return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2)
}

//O(n)
func fibonacciIterative(_ n: Int) -> Int { 
   var fibArr = [0, 1]
   guard n > 1 else { return fibArr[n] }

   for i in 2...n {
     fibArr.append(fibArr[i - 1] + fibArr[i - 2])
   }

   return fibArr[n]
}
