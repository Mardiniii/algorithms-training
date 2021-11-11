// LeetCode problem: https://leetcode.com/problems/single-row-keyboard/

class Solution {
    public int calculateTime(String keyboard, String word) {
        HashMap<Character, Integer> index_by_char = new HashMap<Character, Integer>();
        char[] keyboardChars = keyboard.toCharArray();

        for (int i = 0; i < keyboardChars.length; i++) {
            index_by_char.put(keyboardChars[i], i);
        }

        int time = 0;
        int position = 0;
        char[] wordChars = word.toCharArray();

        for (int i = 0; i < wordChars.length; i++) {
            int currentPosition = index_by_char.get(wordChars[i]);
            int currentTime = Math.abs(position - currentPosition);
            time += currentTime;
            position = currentPosition;
        }

        return time;
    }
}
