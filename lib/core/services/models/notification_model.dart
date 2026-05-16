enum NotificationType { lowStock, saleCompleted }

class NotificationModel {
  final String id;
  final NotificationType type;
  final String title;
  final String body;
  final DateTime createdAt;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.createdAt,
    this.isRead = false,
  });
}
