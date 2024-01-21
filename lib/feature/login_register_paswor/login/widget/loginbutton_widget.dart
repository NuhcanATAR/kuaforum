import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/logregpass_enums/login_enums.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {required this.modelService,
      required this.loginCubit,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic modelService;
  final dynamic loginCubit;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (modelService.formLoginKey.currentState!.validate()) {
          loginCubit.signIn(
            modelService.emailController.text.trim(),
            modelService.passwordController.text.trim(),
          );
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
              text: LoginStrings.loginBtnText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
