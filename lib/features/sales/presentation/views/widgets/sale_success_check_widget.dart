import 'package:flutter/material.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/pulse_ring.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/success_check_icon.dart';

class SaleSuccessCheckWidget extends StatefulWidget {
  const SaleSuccessCheckWidget({super.key});

  @override
  State<SaleSuccessCheckWidget> createState() => _SaleSuccessCheckWidgetState();
}

class _SaleSuccessCheckWidgetState extends State<SaleSuccessCheckWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // checkmark at 600 ms
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.elasticOut),
      ),
    );

    // pulse start after checkmark
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true, min: 0.4, max: 1.0);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.scale(
                scale: _pulseAnimation.value,
                child: PulseRing(),
              ),
              SuccessCheckIcon(),
            ],
          ),
        );
      },
    );
  }
}


