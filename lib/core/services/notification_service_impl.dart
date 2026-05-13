import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stock_mate/core/services/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServiceImpl implements NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

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
        AndroidInitializationSettings('@mipmap/ic_launcher');

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
  Future<void> cancelAll() {
    // TODO: implement cancelAll
    throw UnimplementedError();
  }

  @override
  Future<void> showLowStockAlert({
    required String productName,
    required int currentStock,
    required int threshold,
  }) {
    // TODO: implement showLowStockAlert
    throw UnimplementedError();
  }

  @override
  Future<void> showSaleCompleted({
    required String invoiceNumber,
    required double totalAmount,
  }) {
    // TODO: implement showSaleCompleted
    throw UnimplementedError();
  }
}
