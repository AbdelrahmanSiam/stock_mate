abstract class NotificationService {
  Future<void> init();
  Future<void> showLowStockAlert({
    required String productName,
    required int currentStock,
    required int threshold,
  });
  Future<void> showSaleCompleted({
    required String invoiceNumber,
    required double totalAmount,
  });
  Future<void> cancelAll();
}
