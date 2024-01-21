import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/completeprofile_enum/completeprofile_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class SavedButtonWiget extends StatelessWidget {
  const SavedButtonWiget(
      {required this.routerService,
      required this.modelService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.productCubit,
      required this.phoneNumber,
      super.key});

  final dynamic routerService;
  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic productCubit;
  final dynamic phoneNumber;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () {
          if (modelService.formSelectCityKey.currentState!.validate()) {
            productCubit.uploadProfile(
                phoneNumber, modelService.selectCity.toString(), context);
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
              text: CompleteProfileStrings.profileSavedBtnText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
