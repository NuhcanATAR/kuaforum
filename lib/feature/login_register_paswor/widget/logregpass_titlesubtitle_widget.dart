import 'package:flutter/material.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class LoginRegisterPasswordTitleSubTitleWidget extends StatelessWidget {
  const LoginRegisterPasswordTitleSubTitleWidget(
      {required this.title, required this.subTitle, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 70, bottom: 20),
        child: Column(
          children: <Widget>[
            // title
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: BodyMediumBlackBoldText(
                text: title,
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: LabelMediumGreyText(
                text: subTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
