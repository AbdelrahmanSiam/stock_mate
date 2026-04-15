class ProfitCalculator {
  static double calculateProfit(double buyPrice, double sellPrice) {
    return sellPrice - buyPrice;
  }

  static double calculateProfitPercentage(double buyPrice, double sellPrice) {
    if (buyPrice == 0) return 0;
    return ((sellPrice - buyPrice) / buyPrice) * 100;
  }

  static bool isSellingAtLoss(double buyPrice, double sellPrice) {
    return sellPrice < buyPrice;
  }
}