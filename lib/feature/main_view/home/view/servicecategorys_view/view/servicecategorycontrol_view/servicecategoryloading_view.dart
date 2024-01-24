import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ServiceCategoryLoadingView extends StatelessWidget {
  const ServiceCategoryLoadingView(
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
            padding: const EdgeInsets.all(10),
            child: LoadingAnimationWidget.hexagonDots(
              color: ColorBackgroundConstant.redDarker,
              size: 40,
            ),
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
