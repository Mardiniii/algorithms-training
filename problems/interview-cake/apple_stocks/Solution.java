public class Solution {
  public static int getMaxProfit(int[] stockPrices) {
      if (stockPrices.length < 2) {
          throw new IlegalArgumentException("2 prices are required.");
      }

      int lowestPrice = stockPrices[0];
      int maxProfit = stockPrices[1] - stockPrices[0];

      for (int i = 1; i < stockPrices.length; i++) {
          int currentPrice = stockPrices[i];
          int potentialProfit = currentPrice - lowestPrice;

          maxProfit = Math.max(maxProfit, potentialProfit);
          lowestPrice = Math.min(currentPrice, lowestPrice);
      }

      return maxProfit;
  }
}
