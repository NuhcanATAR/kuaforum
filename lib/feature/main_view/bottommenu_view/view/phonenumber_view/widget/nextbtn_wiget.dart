import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/completeprofile_enum/completeprofile_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget(
      {required this.routerService,
      required this.modelService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic routerService;
  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () {
          if (modelService.formPhoneNumberKey.currentState!.validate()) {
            routerService.selectCityViewNavigatorRouter(
                context, modelService.phoneNumberController);
          }
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
              text: CompleteProfileStrings.nextBtnText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
