/*
You bought a new gaming laptop and like playing a game on it all day. It requires frequent charging due to high graphics usage. You want to know how much battery will be left after a number of playing and charging events.

Write a function that receives n records of the laptop's battery consumption and charging events. An events[i] value represents the number of minutes spent charging the laptop (positive value) or playing the game (negative value). Every minute, the laptop charges 1% or loses 1% of its energy. The battery's charge cannot go over 100%. Return the laptop's final charge percentage, given that the initial charge is 50%. 

Example 1: 
n = 4
events = [10, -20, 61, -15]

Initially, the laptop is charged to 50%. It is plugged in for events[0] = 10 minutes and is charged to 50 + 10 = 60. A game is played for 20 minutes at events[1] = -20, bringing the charge to 40. Charging for another 61 minutes stops when the charge reaches 100, then 15 minutes of play results in a charge of 85. 


Example 2:

events = [25, -30, 70, - 10]

output = 90

Battery charge at start = 50%

It is charged for 25 minutes, charge = 75%

It's then used for 30 minutes, charge = 45%

After, it is charged for 70 minutes, charge = 100% (bc charge can't exceed 100)

Finally, it is used for 10 minutes, charge = 90%.
*/

func getBattery(_ events: [Int]) -> Int {
  var batteryLevel = 50
  for event in events {
    if (batteryLevel + event) > 100 {
      batteryLevel = 100
      continue
    }

    if (batteryLevel + event) < 0 {
      batteryLevel = 0
      continue
    }
    
    batteryLevel += event
  }
  return batteryLevel
}
