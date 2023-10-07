import 'package:dashboard_ui/config.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    required this.mobile,
    this.tablet,
    required this.desktop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppConfig.updateScreenSize(context);

        if(AppConfig.isDesktop) {
          return desktop;
        } else if(tablet != null && AppConfig.isTablet) {
          return tablet!;
        } else { // Mobile
          return mobile;
        }
      },
    );
  }
}