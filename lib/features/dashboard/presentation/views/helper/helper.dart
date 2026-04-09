import 'package:stock_mate/generated/l10n.dart';

String getGreeting() {
  final hour = DateTime.now().hour;
  if (hour >= 5 && hour < 12) return 'Good morning';
  if (hour >= 12 && hour < 17) return 'Good afternoon';
  if (hour >= 17 && hour < 21) return 'Good evening';
  return 'Good night';
}

String getGreetingEmoji() {
  final hour = DateTime.now().hour;
  if (hour >= 5 && hour < 12) return '👋';
  if (hour >= 12 && hour < 17) return '☀️';
  if (hour >= 17 && hour < 21) return '🌆';
  return '🌙';
}

// To generate today as last day on the list
List<String> get dayLabels {
  final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  final today = DateTime.now().weekday % 7;
  return List.generate(7, (i) => days[(today - 6 + i + 7) % 7]);
}

// Convert DateTime to String
String formatTime(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(
    date,
  ); // The difference between the current time and the time that entered (date)

  if (diff.inDays == 0) {
    // If the difference is less than a day (now and date are the same day), show the time in hours and minutes with AM/PM
    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0'); // 5 => 05
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour); // Convert 24-hour format to 12-hour format
    return '$hour12:$minute $period';
  } else if (diff.inDays == 1) {
    // If the difference is exactly one day, show "Yesterday"
    return S.current.yesterday;
  } else {
    return '${diff.inDays} ${S.current.daysAgo}';
  }
}
