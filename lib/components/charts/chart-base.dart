import 'package:dashboard_ui/components/containers/rounded-container.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';

class ChartBase extends StatelessWidget {
  final double width, height;
  final String title;
  final Widget chart;

  const ChartBase({super.key, required this.width, required this.height, required this.title, required this.chart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width-12, // Esse -12 é o padding
      height: height-12,
      padding: const EdgeInsets.only(right: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTheme.themeData.textTheme.titleLarge),
          const SizedBox(height: 8),
          Expanded(child: RoundedContainer(child: chart)),
        ],
      ),
    );
  }
}