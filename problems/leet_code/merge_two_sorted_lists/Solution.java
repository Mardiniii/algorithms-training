/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */

class Solution {
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummyNode = new ListNode(0);
        ListNode currentResultNode = dummyNode;

        while (l1 != null || l2 != null) {
            if (l1 == null) {
                currentResultNode.next = new ListNode(l2.val);
                l2 = l2.next;
            } else if (l2 == null) {
                currentResultNode.next = new ListNode(l1.val);
                l1 = l1.next;
            } else if (l1.val <= l2.val) {
                currentResultNode.next = new ListNode(l1.val);
                l1 = l1.next;
            } else {
                currentResultNode.next = new ListNode(l2.val);
                l2 = l2.next;
            }

            currentResultNode = currentResultNode.next;
        }

        return dummyNode.next;
    }
}
