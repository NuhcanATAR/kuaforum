import 'package:flutter/material.dart';
import 'package:kuaforum/feature/splash/splash_view.dart';
import 'package:kuaforum/product/initialize/app_start.dart';

void main() async {
  await AppStart.initStart();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: CustomLightTheme().themeData,
      home: SplashView(),
    );
  }
}
