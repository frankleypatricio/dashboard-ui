import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? paddig, margin;
  final double? width, height;

  const RoundedContainer({
    required this.child,
    this.color,
    this.paddig,
    this.margin,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: paddig ?? const EdgeInsets.all(8),
      width: width, height: height,
      decoration: BoxDecoration(
        color: color ?? AppTheme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
