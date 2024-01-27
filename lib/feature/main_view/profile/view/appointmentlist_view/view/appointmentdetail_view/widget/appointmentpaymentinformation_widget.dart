import 'package:flutter/material.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentPaymentInformationWidget extends StatelessWidget {
  const AppointmentPaymentInformationWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              // payment type
              Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 15),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: BodyMediumBlackBoldText(
                        text: "Ödeme Yöntemi:",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    LabelMediumBlackText(
                      text: "${data['PAYMENTTYPE']}",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              // total price
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: BodyMediumBlackBoldText(
                        text: "Toplam Ödeme:",
                        textAlign: TextAlign.left,
                      ),
                    ),
                    LabelMediumBlackText(
                      text: "${data['TOTALPRICE']}₺",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
