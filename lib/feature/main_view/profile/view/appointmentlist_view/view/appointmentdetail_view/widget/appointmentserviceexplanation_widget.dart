import 'package:flutter/material.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentServiceExplanationWidget extends StatelessWidget {
  const AppointmentServiceExplanationWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: maxWidth,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: BodyMediumBlackBoldText(
                    text: "Ek Açıklama:",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                width: maxWidth,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: LabelMediumBlackText(
                    text: data['EXPLANATION'],
                    textAlign: TextAlign.left,
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
