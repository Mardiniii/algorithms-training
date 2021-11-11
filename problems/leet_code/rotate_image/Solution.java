// LeetCode problem: https://leetcode.com/explore/featured/card/google/59/array-and-strings/3052/

class Solution {
    public void rotate(int[][] matrix) {
        int n = matrix.length;

        for (int i = 0; i < n; i++){
            for (int j = i; j < n; j++){
                int temp = matrix[j][i];
                matrix[j][i] = matrix[i][j];
                matrix[i][j] = temp;
            }
        }

        for (int i = 0; i < n; i++) {
            reverse(matrix[i]);
        }
    }

    private void reverse(int[] row) {
        int i = 0, j = row.length - 1;

        while (i < j) {
            swap(row, i, j);
            i++;
            j--;
        }
    }

    private void swap(int[] row, int i, int j) {
        int temp = row[i];
        row[i] = row[j];
        row[j] = temp;
    }
}
