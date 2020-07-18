/*
Find the sum of all left leaves in a given binary tree.

Example:

    3
   / \
  9  20
    /  \
   15   7

There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
*/

func sumOfLeftLeavesRecursive(_ root: TreeNode?) -> Int {
  guard let root = root else { return 0 }
  var sum = 0
  if let left = root.left {
    if left.left == nil && left.right == nil {
      sum += left.val
    }
  }
  return sum + sumOfLeftLeavesRecursive(root.left) + sumOfLeftLeavesRecursive(root.right)
}




//Tree definition
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
