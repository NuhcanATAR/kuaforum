import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/bottommenu_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/appointment_enum/appointmentcreate_enum/appointmentcreate_enum.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentSuccessView extends StatelessWidget {
  const AppointmentSuccessView(
      {required this.maxWidth, required this.dynamicHeight, super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumMainColorText(
          text: "Randevunuz Alındı!",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.medium,
        child: ListView(
          children: <Widget>[
            // ıcon
            buildIconWidget,
            // title & description
            buildTitleDescriptionWidget,
            // back button
            buildBackButtonWidget(context),
          ],
        ),
      ),
    );
  }

  // ıcon
  Widget get buildIconWidget => Padding(
        padding: const EdgeInsets.only(left: 120, right: 120),
        child: AppointmentIcon.successIcon.toImg,
      );
  // title & description
  Widget get buildTitleDescriptionWidget => Column(
        children: <Widget>[
          // title
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: BodyMediumBlackBoldText(
              text: AppointmentCreateStrings.successTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
          // description
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: LabelMediumBlackText(
              text: AppointmentCreateStrings.successSubTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  // back button
  Widget buildBackButtonWidget(context) => GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomMenuView(),
              ),
              (Route<dynamic> route) => false);
        },
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.07),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorBackgroundConstant.redDarker,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: LabelMediumWhiteText(
              text: AppointmentCreateStrings.backBtnText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
