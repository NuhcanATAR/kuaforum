import 'package:flutter/material.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ServiceTitleSubTitleWidget extends StatelessWidget {
  const ServiceTitleSubTitleWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // service title
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: BodyMediumBlackBoldText(
              text: data['SERVICETITLE'],
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // service sub title
        SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: LabelMediumBlackText(
              text: data['SERVICESUBTITLE'],
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
