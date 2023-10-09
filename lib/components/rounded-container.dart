import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding, margin;
  final double? width, height, radius;
  final BoxBorder? border;

  const RoundedContainer({
    required this.child,
    this.color,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.radius,
    this.border,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.all(8),
      width: width, height: height,
      decoration: BoxDecoration(
        color: color ?? AppTheme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: border,
      ),
      child: child,
    );
  }
}
