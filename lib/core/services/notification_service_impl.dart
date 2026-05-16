import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stock_mate/core/services/models/notification_model.dart';
import 'package:stock_mate/core/services/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;

class NotificationServiceImpl implements NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  final List<NotificationModel> _notifications = [];
  // Notification IDs to ensure we can update/cancel specific notifications later
  static const int _lowStockBaseId = 1000;
  static const int _saleCompletedId = 2000;

  // ── init ───────────────────────────────────────────────────
  // Initialize the plugin with the settings for Android وiOS
  // Ask permission from user for Android 13+
  // Initialize the timezone library for scheduled notifications
  // Make notification channel for Android — Asked form Android 8+
  @override
  Future<void> init() async {
    tz.initializeTimeZones();

    // ── Android Settings ───────────────────────────────────
    // ic_notification:  Name of drawable icon at res folder
    // Add icon at coming steps
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('ic_stat_notify');

    // ── iOS Settings ───────────────────────────────────────
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      settings: initSettings,
      // callback When user click on notification
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Ask permission on Android 13+
    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    // Make notification channels
    await _createNotificationChannels();
  }

  // ── _onNotificationTapped ──────────────────────────────────
  // Called when user click on notification
  void _onNotificationTapped(NotificationResponse response) {
    // response.payload بيحمل data إضافية لو عايزنا نـ navigate
    // مثال: لو اتضغط على low stock alert → نروح Products screen
  }

  // ── _createNotificationChannels ────────────────────────────
  Future<void> _createNotificationChannels() async {
    const AndroidNotificationChannel lowStockChannel =
        AndroidNotificationChannel(
          'low_stock_channel', // id
          'Low Stock Alerts', // name
          description: 'Alerts when product stock is running low',
          importance: Importance.high, // Make voice and come till DMD
        );

    const AndroidNotificationChannel saleChannel = AndroidNotificationChannel(
      'sale_channel',
      'Sale Notifications',
      description: 'Notifications for completed sales',
      importance: Importance.defaultImportance,
    );

    final AndroidFlutterLocalNotificationsPlugin? androidPlugin = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.createNotificationChannel(lowStockChannel);
    await androidPlugin?.createNotificationChannel(saleChannel);
  }

  @override
  Future<void> cancelAll() => _plugin.cancelAll();

  // ── showLowStockAlert ──────────────────────────────────────
  // Show notification when product stock reaches the threshold or falls below it
  // Use productName as the ID basis so each product has a unique notification
  // If the product has been notified before, update the same notification
  @override
  Future<void> showLowStockAlert({
    required String productName,
    required int currentStock,
    required int threshold,
  }) async {
    //  Make unique ID form each product in hashCode
    final int notificationId =
        _lowStockBaseId + productName.hashCode.abs() % 1000;

    // في showLowStockAlert و showSaleCompleted
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'low_stock_channel',
          'Low Stock Alerts',
          channelDescription: 'Alerts when product stock is running low',
          importance: Importance.high,
          priority: Priority.high,
          icon: 'ic_stat_notify',
          color: Color(0xFFFF6B2C),
          playSound: true,
          enableVibration: true,
          ongoing: false,
          autoCancel: true,
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
    );
    await _plugin.show(
      id: notificationId,
      title: '⚠️ Low Stock Alert',
      body: '$productName — Only $currentStock left (threshold: $threshold)',
      notificationDetails: details,
    );
    _notifications.insert(
      0,
      NotificationModel(
        id: '$notificationId-${DateTime.now().millisecondsSinceEpoch}',
        type: NotificationType.lowStock,
        title: '⚠️ Low Stock Alert',
        body: '$productName — Only $currentStock left (threshold: $threshold)',
        createdAt: DateTime.now(),
      ),
    );
  }

  // ── showSaleCompleted ──────────────────────────────────────
  // Show notification after Batch Write succeeds
  // Use fixed ID so that multiple sales update the same notification
  @override
  Future<void> showSaleCompleted({
    required String invoiceNumber,
    required double totalAmount,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'sale_channel',
          'Sale Notifications',
          channelDescription: 'Notifications for completed sales',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          icon: 'ic_stat_notify',
          color: Color(0xFF2ED573), // success color
        );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
    );

    await _plugin.show(
      id: _saleCompletedId,
      title: '✅ Sale Completed',
      body: '$invoiceNumber — \$${totalAmount.toStringAsFixed(2)}',
      notificationDetails: details,
    );
    _notifications.insert(
      0,
      NotificationModel(
        id: '$_saleCompletedId-${DateTime.now().millisecondsSinceEpoch}',
        type: NotificationType.saleCompleted,
        title: '✅ Sale Completed',
        body: '$invoiceNumber — \$${totalAmount.toStringAsFixed(2)}',
        createdAt: DateTime.now(),
      ),
    );
  }

  @override
  void clearAll() {
    return _notifications.clear();
  }

  @override
  List<NotificationModel> getNotifications() {
    return List.unmodifiable(_notifications);
  }

  @override
  int getUnreadCount() {
    return _notifications.where((n) => !n.isRead).length;
  }

  @override
  void markAllAsRead() {
    for (final n in _notifications) {
      n.isRead = true;
    }
  }
}
