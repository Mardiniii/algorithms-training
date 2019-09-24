// LeetCode Problem: https://leetcode.com/problems/remove-vowels-from-a-string/

class Solution {
    public String removeVowels(String S) {
      return S.replaceAll("[aeiou]", "");
    }
}
