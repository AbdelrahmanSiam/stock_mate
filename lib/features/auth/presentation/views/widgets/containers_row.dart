import 'package:flutter/material.dart';

class ContainersRow extends StatelessWidget {
  const ContainersRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0XFF1B1F2C),
              ),
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xFF2F1E21),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
