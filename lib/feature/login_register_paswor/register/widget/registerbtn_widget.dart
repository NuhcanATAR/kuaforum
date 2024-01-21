import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/logregpass_enums/register_enums.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.modelService,
      required this.authCubit,
      super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic modelService;
  final dynamic authCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          if (modelService.formRegisterKey.currentState!.validate()) {
            authCubit.signUp(
                modelService.emailController.text,
                modelService.passwordController.text,
                modelService.nameController.text,
                modelService.surnameController.text,
                context);
            modelService.nameController.clear();
            modelService.surnameController.clear();
            modelService.emailController.clear();
            modelService.passwordController.clear();
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
              text: RegisterStrings.registerBtnText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
