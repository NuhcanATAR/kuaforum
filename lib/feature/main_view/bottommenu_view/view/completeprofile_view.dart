import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/view/phonenumber_view/phonenumber_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/completeprofile_enum/completeprofile_enum.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';
import 'package:animate_do/animate_do.dart';

class CompleteProfileView extends StatelessWidget {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // title
            buildTitleWidget,
            // sub title
            buildSubTitleWiget,
            // button
            buildButtonWidget(context),
          ],
        ),
      ),
    );
  }

  // title
  Widget get buildTitleWidget => FadeInLeft(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BodyMediumBlackBoldText(
            text: CompleteProfileStrings.mainTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
      );
  // sub title
  Widget get buildSubTitleWiget => FadeInRight(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: LabelMediumBlackText(
            text: CompleteProfileStrings.mainSubTitleText.value,
            textAlign: TextAlign.center,
          ),
        ),
      );
  // button
  Widget buildButtonWidget(context) => FadeInUp(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PhoneNumberView(),
              ),
            );
          },
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorBackgroundConstant.redDarker,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: LabelMediumWhiteText(
              text: CompleteProfileStrings.mainCompleteBtnText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
