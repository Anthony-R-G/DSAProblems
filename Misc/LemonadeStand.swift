/*
At a lemonade stand, each lemonade costs $5.

Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills).

Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill. You must provide the correct change to each customer, so that the net transaction is that the customer pays $5.

Return true if and only if you can provide every customer with correct change.


 Examples
[5,5,10] -> True
[10,10] -> False
[5, 10, 5, 10, 20] -> False

*/


func canServiceAllCustomers(_ arr: [bills]) -> Bool {
  guard arr[0] == 5 else { return false }

  var availFiveBills = 0
  var availTenBills = 0
 
  for num in arr {
    if num == 5 {
      availFiveBills += 1
    }

    if num == 10 {
      if availFiveBills >= 1 {
        availFiveBills -= 1
        availTenBills += 1
      } else {
        return false
      }
    }

    if num == 20 {
      if availFiveBills >= 3 {
        availFiveBills -= 3
      } else if availFiveBills >= 1 && availTenBills >= 1 {
        availFiveBills -= 1
        availTenBills -= 1
      } else {
        return false
      }
    }
  }
  return true
}
