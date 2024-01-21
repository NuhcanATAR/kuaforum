import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/enums/mainview_enums/completeprofile_enum/completeprofile_enum.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({required this.maxWidth, super.key});

  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        FadeInDown(
          child: SizedBox(
            width: maxWidth,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: BodyMediumBlackBoldText(
                text: CompleteProfileStrings.phoneNumberTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        // sub title
        FadeInDown(
          child: SizedBox(
            width: maxWidth,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              child: LabelMediumBlackText(
                text: CompleteProfileStrings.phoneNumberSubTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
