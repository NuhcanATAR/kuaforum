import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentRejectStatusWidget extends StatelessWidget {
  const AppointmentRejectStatusWidget(
      {required this.data,
      required this.title,
      required this.subTitle,
      super.key});

  final Map<String, dynamic> data;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return data['REJECTSTATUS'] == true
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // icon
              SizedBox(
                width: 60,
                height: 60,
                child: AppointmentIcon.cancelIcon.toImg,
              ),
              // title
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: BodyMediumBlackBoldText(
                  text: title,
                  textAlign: TextAlign.center,
                ),
              ),
              // description
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: LabelMediumBlackText(
                  text: subTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
