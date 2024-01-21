import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/bottommenu_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginLoadingView extends StatelessWidget {
  const LoginLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomMenuView(),
            ),
            (Route<dynamic> route) => false);
      },
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // loading
            Padding(
              padding: const EdgeInsets.all(10),
              child: LoadingAnimationWidget.hexagonDots(
                color: ColorBackgroundConstant.redDarker,
                size: 45,
              ),
            ),
            // title
            const Padding(
              padding: EdgeInsets.all(10),
              child: BodyMediumBlackBoldText(
                text: "Bilgileriniz Kontrol Ediliyor",
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            const Padding(
              padding: EdgeInsets.all(5),
              child: LabelMediumGreyText(
                text: "Lütfen Bekleyiniz...",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
