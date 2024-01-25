import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/appointment_enum/appointmentcreate_enum/appointmentcreate_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingSuccessView extends StatelessWidget {
  const LoadingSuccessView(
      {required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 5,
        ), () {
      routerService.appointmentSuccessViewNavigatorRouter(
          context, maxWidth, dynamicHeight);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // loading
            buildLoadingWidget,
            // title & sub title
            buildTitleSubTitleWidget,
          ],
        ),
      ),
    );
  }

  // loading
  Widget get buildLoadingWidget => LoadingAnimationWidget.hexagonDots(
        color: ColorBackgroundConstant.redDarker,
        size: 45,
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => Column(
        children: <Widget>[
          // title
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
            child: LabelMediumBlackBoldText(
              text: AppointmentCreateStrings.appointmentLoadingTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
          // sub title
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: LabelMediumGreyText(
              text:
                  AppointmentCreateStrings.appointmentLoadingSubTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
