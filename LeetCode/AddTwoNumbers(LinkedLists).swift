/*

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.

*/

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
  guard l1 != nil else { return l2 }
  guard l2 != nil else { return l1 }

  let newListHead = ListNode(0)
  var newListTail = newListHead
  var l1 = l1
  var l2 = l2
  var carry = 0 

  while let list1Node = l1, let list2Node = l2 {
    let sum = (list1Node.val + list2Node.val) + carry
    newListTail.next = ListNode(sum % 10)
    newListTail = newListTail.next!
  
    carry = sum > 9 ? 1 : 0
    
    l1 = list1Node.next
    l2 = list2Node.next
  }

  while let remainingList1Node = l1 {
    let sum = remainingList1Node.val + carry
    newListTail.next = ListNode((sum % 10))
    newListTail = newListTail.next!
    carry = sum > 9 ? 1 : 0

    l1 = remainingList1Node.next
  }

  while let remainingList2Node = l2 {
    let sum = remainingList2Node.val + carry
    newListTail.next = ListNode((sum % 10 ))
    newListTail = newListTail.next!
    carry = sum > 9 ? 1 : 0

    l2 = remainingList2Node.next
  }

  if carry != 0 {
    newListTail.next = ListNode(1)
    newListTail = newListTail.next!
  }
  
  return newListHead.next!
}
