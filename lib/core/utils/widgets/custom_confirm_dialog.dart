import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onConfirm;
  final bool isLoading;

  const CustomConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.icon = Icons.warning_rounded,
    this.iconColor = AppColorsDarkMode.error,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColorsDarkMode.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColorsDarkMode.border,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 18,
              spreadRadius: 0,
              offset: Offset(0, 10),
              color: Colors.black26,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DialogIcon(
              icon: icon,
              color: iconColor,
            ),
            const SizedBox(height: 18),
            _DialogTitle(title: title),
            const SizedBox(height: 10),
            _DialogMessage(message: message),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _CancelButton(
                    text: cancelText,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ConfirmButton(
                    text: confirmText,
                    color: iconColor,
                    isLoading: isLoading,
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _DialogIcon({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color,
        size: 30,
      ),
    );
  }
}

class _DialogTitle extends StatelessWidget {
  final String title;

  const _DialogTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }
}

class _DialogMessage extends StatelessWidget {
  final String message;

  const _DialogMessage({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14,
        height: 1.5,
        color: AppColorsDarkMode.textSecondary,
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _CancelButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppColorsDarkMode.border,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final bool isLoading;

  const _ConfirmButton({
    required this.text,
    required this.color,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}