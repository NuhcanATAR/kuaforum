import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget(
      {required this.profileCubitService,
      required this.modelService,
      required this.nameController,
      required this.surnameController,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic profileCubitService;
  final dynamic modelService;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          if (modelService.formUpdateKey.currentState!.validate()) {
            profileCubitService.nameSurnameUpdate(
                nameController, surnameController);
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
            child: const LabelMediumWhiteText(
              text: "Güncelle",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
