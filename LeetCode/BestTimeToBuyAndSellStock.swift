/*
Say you have an array for which the ith element is the price of a given stock on day i.

If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

Note that you cannot sell a stock before you buy one.

input = [7,1,5,3,6,4]
Output = 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
             Not 7-1 = 6, as selling price needs to be larger than buying price.

input = [7,6,4,3,1]
Output = 0

input = [2,4,1]
Output = 2
*/

//Time complexity: O(n) -> Iterate through the array one time. 
//Space complexity: O(1) -> Because only two variables are used and they each just hold one number.
func maxProfit(_ prices: [Int]) -> Int {
  var minPrice = Int.max
  var maxProfit = Int()

  for stockPrice in prices {
    if stockPrice < minPrice {
      minPrice = stockPrice
    }

    if (stockPrice - minPrice) > maxProfit {
      maxProfit = stockPrice - minPrice
    }
  }
  return maxProfit
}
