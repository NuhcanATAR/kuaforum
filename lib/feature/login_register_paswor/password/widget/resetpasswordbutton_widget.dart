import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/logregpass_enums/password_enums.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ResetPasswordButtonWidget extends StatelessWidget {
  const ResetPasswordButtonWidget(
      {required this.modelService,
      required this.resetPasswordCubit,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic modelService;
  final dynamic resetPasswordCubit;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (modelService.formResPassKey.currentState!.validate()) {
          resetPasswordCubit.resetPassword(modelService.emailController.text);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
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
              text: PasswordStrings.resetBtnText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
