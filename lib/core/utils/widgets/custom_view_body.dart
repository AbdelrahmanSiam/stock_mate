import 'package:flutter/material.dart';

class CustomViewBody extends StatelessWidget {
  const CustomViewBody({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Center(child: widget),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
