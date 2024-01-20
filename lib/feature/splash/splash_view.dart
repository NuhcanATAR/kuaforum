import 'package:flutter/material.dart';
import 'package:kuaforum/feature/splash/splashslider_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/image_constant.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 4,
        ), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashSliderView(),
          ),
          (Route<dynamic> route) => false);
    });
    return Scaffold(
      backgroundColor: ColorBackgroundConstant.redDarker,
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(70),
              child: AppLogoConstant.appLogoRed.toImg)),
    );
  }
}
