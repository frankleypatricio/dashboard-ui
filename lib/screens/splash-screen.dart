import 'package:dashboard_ui/components/rounded-container.dart';
import 'package:dashboard_ui/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      Navigator.pushReplacementNamed(context, routes.home);
      await Window.setEffect(effect: WindowEffect.transparent);
      windowManager.setTitleBarStyle(TitleBarStyle.normal);
      windowManager.setMinimumSize(const Size(300, 300));
      windowManager.setMaximumSize(const Size(1920, 1080));
      windowManager.setSize(const Size(1280, 720));
      windowManager.center();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: RoundedContainer(
          width: 400, height: 400,
          padding: EdgeInsets.all(110),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
