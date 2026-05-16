import 'package:stock_mate/core/services/models/notification_model.dart';

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
  List<NotificationModel> getNotifications();
  int getUnreadCount();
  void markAllAsRead();
  void clearAll();
  Future<void> cancelAll();
}
