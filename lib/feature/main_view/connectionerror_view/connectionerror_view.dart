import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/connectionerror_enum/connectionerror_enum.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ConnectionErrorView extends StatelessWidget {
  const ConnectionErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: context.padding.medium,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // img
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: AppErrorImgConstant.connectionErrorImg.toImg,
              ),
              // title
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: BodyMediumBlackBoldText(
                  text: ConnectionErrorStrings.titleText.value,
                  textAlign: TextAlign.center,
                ),
              ),
              // sub title
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: LabelMediumBlackText(
                  text: ConnectionErrorStrings.subTitleText.value,
                  textAlign: TextAlign.center,
                ),
              ),
              // button
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: LabelMediumMainColorText(
                    text: ConnectionErrorStrings.backButtonText.value,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
