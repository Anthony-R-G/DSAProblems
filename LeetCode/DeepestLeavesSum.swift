//Given a binary tree, return the sum of values of its deepest leaves.


//TreeNode definition
class TreeNode {
   var val: Int
   var left: TreeNode?
   var right: TreeNode?
   
   init(_ val: Int,_ left: TreeNode? = nil ,_ right: TreeNode? = nil) {
     self.val = val
     self.left = left
     self.right = right
   }
 }

 extension TreeNode: CustomStringConvertible {
  public var description: String {
    return String(describing: val)
  }
}


//Find height of tree
func height(of node: TreeNode?) -> Int {
  guard let node = node else { return -1 }
  return 1 + max(height(of: node.left), height(of: node.right))
  }


func deepestLeavesSum(_ root: TreeNode?) -> Int {
  let maxDepthLevel = height(of: root)

  var queue: [TreeNode] = []
  queue.append(root!)
  var nodesOnCurrentLevel = 1
  var nodesLookedAtOnLevel = 0
  var levelCount = 0
  var sum = 0

  //bfs
  while !queue.isEmpty {
    if nodesLookedAtOnLevel == nodesOnCurrentLevel {
      levelCount += 1
      nodesLookedAtOnLevel = 0
      nodesOnCurrentLevel = queue.count
    }

    let node = queue.removeFirst()

    guard levelCount != maxDepthLevel else {
      sum += node.val
      continue
    }

    if let left = node.left {
      queue.append(left)
    }

    if let right = node.right {
      queue.append(right)
    }

    nodesLookedAtOnLevel += 1
  }

  return sum
}
