import 'package:flutter/material.dart';
import 'package:kuaforum/feature/splash/splash_view.dart';
import 'package:kuaforum/product/theme/custom_light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomLightTheme().themeData,
      home: const SplashView(),
    );
  }
}
