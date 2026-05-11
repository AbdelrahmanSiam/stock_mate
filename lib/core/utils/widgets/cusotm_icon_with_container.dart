import 'package:flutter/widgets.dart';

class CustomIconWithContainer extends StatelessWidget {
  const CustomIconWithContainer({
    super.key,
    required this.leadingIcon,
    required this.color,
  });

  final IconData leadingIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(leadingIcon, color: color),
    );
  }
}
