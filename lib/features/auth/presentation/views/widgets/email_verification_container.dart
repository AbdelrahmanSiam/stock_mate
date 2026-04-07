import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/tip_icon.dart';
import 'package:stock_mate/generated/l10n.dart';

class EmailVerificationContainer extends StatelessWidget {
  const EmailVerificationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0XFF262A37),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TipIcon(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).proTip,
                  style: AppStyles.labelSemiBold13(context),
                ),
                const SizedBox(height: 6),
                Text(
                  S.of(context).proTipTagline,
                  style: AppStyles.bodySmallRegular12(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
