import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget(
      {required this.profileCubitService,
      required this.cityValue,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic profileCubitService;

  final String cityValue;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          profileCubitService.cityUpdate(cityValue);
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
