/*
Balanced strings are those who have equal quantity of 'L' and 'R' characters.

Given a balanced string s split it in the maximum amount of balanced strings.

Return the maximum amount of splitted balanced strings.

Example input = "RLRRLLRLRL"
Output = 4
Explanation: str can be split into "RL", "RRLL", "RL", "RL", each substring contains same number of 'L' and 'R'.

Example input = "RLRRRLLRLL"
Output = 2
Explanation: str can be split into "RL", "RRRLLRLL", since each substring contains an equal number of 'L' and 'R'
*/


func balancedStringSplit(_ s: String) -> Int {

  var balanceCounter = 0
  
  var amountOfBalancedStrings = 0

  for char in s {
    if char == "R" {
      balanceCounter -= 1
    }

    if char == "L" {
      balanceCounter += 1
    }

    if balanceCounter == 0 {
      amountOfBalancedStrings += 1
    }
  }
  
  return amountOfBalancedStrings
}
