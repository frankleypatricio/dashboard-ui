import 'package:dashboard_ui/routes.dart' as routes;
import 'package:dashboard_ui/screens/home-screen.dart';
import 'package:dashboard_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await Window.setEffect(effect: WindowEffect.transparent);

  const size = Size(400, 400);
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow(
    const WindowOptions(
      size: size,
      minimumSize: size,
      maximumSize: size,
      center: true,
      fullScreen: false,
      titleBarStyle: TitleBarStyle.hidden,
    ), () async {
      await windowManager.show();
      await windowManager.focus();
    },
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      onGenerateRoute: routes.controller,
      initialRoute: routes.splash,
      home: const HomeScreen(),
    );
  }
}