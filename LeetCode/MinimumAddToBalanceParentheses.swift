/*
Given a string S of '(' and ')' parentheses, we add the minimum number of parentheses ( '(' or ')', and in any positions ) so that the resulting parentheses string is valid.

Formally, a parentheses string is valid if and only if:

-It is the empty string, or
-It can be written as AB (A concatenated with B), where A and B are valid strings, or
-It can be written as (A), where A is a valid string.

Given a parentheses string, return the minimum number of parentheses we must add to make the resulting string valid.
*/

func minAddToMakeBalance(_ S: String) -> Int {
  var stack: [Character] = []

  for char in S {
    if char == "(" {
      stack.append(char)
    }

    if char == ")" {
      if stack.last == "(" {
        _ = stack.popLast()
      } else {
        stack.append(char)
      }
    }
  }
  return stack.count
}

