// LeetCode problem: https://leetcode.com/explore/featured/card/google/59/array-and-strings/3047/

// O(n^3)
// class Solution {
//    public int lengthOfLongestSubstring(String s) {
//        int n = s.length();
//        int maxLength = 0;
//
//        for (int i = 0; i < n; i++) {
//            for (int j = i + 1; j <= n; j++) {
//                if (allUnique(s, i, j)) maxLength = Math.max(maxLength, j - i);
//            }
//        }
//
//        return maxLength;
//    }
//
//    private boolean allUnique(String s, int start, int end) {
//        Set<Character> set = new HashSet<>();
//
//        for (int i = start; i < end; i++) {
//            Character currentChar = s.charAt(i);
//            if (set.contains(currentChar)) return false;
//
//            set.add(currentChar);
//        }
//
//        return true;
//    }
// }

// O(n)
class Solution {
    public int lengthOfLongestSubstring(String s) {
        int n = s.length();
        Set<Character> set = new HashSet<>();
        int maxLength = 0, i = 0, j = 0;

        while (i < n && j < n) {
            if (!set.contains(s.charAt(j))) {
                set.add(s.charAt(j++));
                maxLength = Math.max(maxLength, j - i);
            } else {
                set.remove(s.charAt(i++));
            }
        }

        return maxLength;
    }
}
