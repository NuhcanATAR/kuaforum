import 'package:flutter/material.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentDateWidget extends StatelessWidget {
  const AppointmentDateWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              const LabelMediumBlackBoldText(
                text: "Randevu Tarihi:",
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: LabelMediumBlackText(
                    text:
                        "${data['DAY']}.${data['MONTH']}.${data['YEAR']} | ${data['HOUR']}:${data['MINUTE']}",
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
