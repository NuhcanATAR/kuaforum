import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/profile_enum/profile_enum.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class EmailUpdateView extends StatelessWidget {
  const EmailUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.redDarker,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Email Adresi Güncelleme",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.medium,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // image
              buildImageWidget,
              // title
              buildTitleWidget,
              // sub title
              buildSubTitleWidget,
            ],
          ),
        ),
      ),
    );
  }

  // image
  Widget get buildImageWidget => Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
        child: AppErrorImgConstant.changeMail.toImg,
      );
  // title
  Widget get buildTitleWidget => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: BodyMediumBlackBoldText(
          text: ProfileStrings.emailUpdateNoTitleText.value,
          textAlign: TextAlign.center,
        ),
      );

  // sub title
  Widget get buildSubTitleWidget => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: LabelMediumBlackText(
          text: ProfileStrings.emailUpdateNotSubTitleText.value,
          textAlign: TextAlign.center,
        ),
      );
}
