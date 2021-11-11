Write a method to find the 2nd largest element in a binary search tree.

Here's a sample binary tree node class:

```java
public class BinaryTreeNode {

  public int value;
  public BinaryTreeNode left;
  public BinaryTreeNode right;

  public BinaryTreeNode(int value) {
      this.value = value;
  }

  public BinaryTreeNode insertLeft(int leftValue) {
      this.left = new BinaryTreeNode(leftValue);
      return this.left;
  }

  public BinaryTreeNode insertRight(int rightValue) {
      this.right = new BinaryTreeNode(rightValue);
      return this.right;
  }
}
```
