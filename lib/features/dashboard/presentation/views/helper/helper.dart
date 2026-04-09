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