import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/string_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.loginViewNavigatorRouter(context);
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
          child: const LabelMediumWhiteText(
            text: LogRegViewConstant.loginBtnText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
