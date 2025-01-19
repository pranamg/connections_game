import 'package:flutter/material.dart';
import 'dart:math';

class ShakeWidget extends StatefulWidget {
  final Widget child;
  final bool shake;
  final double offset;
  final Duration duration;

  const ShakeWidget({
    super.key,
    required this.child,
    this.shake = false,
    this.offset = 10,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> offsetAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    offsetAnimation = Tween(begin: 0.0, end: widget.offset)
        .chain(CurveTween(curve: ShakeCurve()))
        .animate(controller);
  }

  @override
  void didUpdateWidget(ShakeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shake) {
      controller.forward().then((_) {
        controller.reset();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: offsetAnimation,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(offsetAnimation.value, 0),
          child: child,
        );
      },
    );
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return sin(t * 3 * pi) * (1 - t);
  }
}
