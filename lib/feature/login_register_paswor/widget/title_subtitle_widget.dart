import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/string_constant.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        // title
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: BodyMediumBlackBoldText(
            text: LogRegViewConstant.titleText,
            textAlign: TextAlign.center,
          ),
        ),
        // sub title
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: LabelMediumGreyText(
            text: LogRegViewConstant.subtitleText,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
