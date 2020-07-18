

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numPairs : [Int : Int ] = [:]
        
        for i in 0..<nums.count {
            if let sumPairNumIndex = numPairs[(target - nums[i])] {
                return ([sumPairNumIndex, i])
            } else {
                numPairs[(nums[i])] = i
            } 
        }
        return [Int]()
    }
