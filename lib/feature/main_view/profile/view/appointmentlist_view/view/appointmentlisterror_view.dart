import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentListErrorView extends StatelessWidget {
  const AppointmentListErrorView(
      {required this.title, required this.subTitle, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: AppErrorImgConstant.errorImg.toImg,
          ),
          // title
          Padding(
            padding: const EdgeInsets.all(5),
            child: LabelMediumBlackBoldText(
              text: title,
              textAlign: TextAlign.center,
            ),
          ),
          // sub title
          Padding(
            padding: const EdgeInsets.all(5),
            child: LabelMediumGreyText(
              text: subTitle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
