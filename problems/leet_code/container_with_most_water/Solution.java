// LeetCode problem: https://leetcode.com/explore/featured/card/google/59/array-and-strings/3048/

// Time complexity O(n^2)
/*
class Solution {
    public int maxArea(int[] height) {
        int maxArea = 0;

        for (int i = 0; i < height.length; i++) {
            for (int j = i + 1; j < height.length; j++ ) {
                int minHeight = Math.min(height[i], height[j]);
                maxArea = Math.max(maxArea, minHeight * (j - i));
            }
        }

        return maxArea;
    }
}
*/

// Time complexity O(n)
class Solution {
    public int maxArea(int[] height) {
        int n = height.length;
        int maxArea = 0, i = 0, j = n - 1;

        while (i < j) {
            int minHeight = Math.min(height[i], height[j]);
            maxArea = Math.max(maxArea, minHeight * (j - i));

            if (height[i] < height[j]) {
                i++;
            } else {
                j--;
            }
        }

        return maxArea;
    }
}
