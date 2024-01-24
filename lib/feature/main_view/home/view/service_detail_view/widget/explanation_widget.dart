import 'package:flutter/material.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ExplanationWidget extends StatelessWidget {
  const ExplanationWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: maxWidth,
          child: const Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: LabelMediumBlackBoldText(
              text: "Hizmet Hakkında: ",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: LabelMediumBlackText(
              text: data['SERVICEEXPLANATION'],
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
