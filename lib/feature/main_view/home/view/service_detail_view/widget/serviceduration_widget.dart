import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ServiceDurationWidget extends StatelessWidget {
  const ServiceDurationWidget(
      {required this.maxWidth, required this.data, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 15),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.date_range,
              color: ColorBackgroundConstant.redDarker,
              size: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: LabelMediumBlackText(
                  text:
                      "${data['SERVICEDURATION']} ${data['SERVICEDURATIONTYPE']}",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
