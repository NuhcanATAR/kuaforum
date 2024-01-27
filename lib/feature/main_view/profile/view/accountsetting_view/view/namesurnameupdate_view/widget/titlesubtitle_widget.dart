import 'package:flutter/material.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget(
      {required this.maxWidth,
      required this.title,
      required this.subTitle,
      super.key});

  final dynamic maxWidth;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: BodyMediumBlackBoldText(
              text: title,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // sub title
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: LabelMediumBlackText(
              text: subTitle,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
