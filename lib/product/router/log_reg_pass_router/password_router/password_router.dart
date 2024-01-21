import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/logregpass_enums/password_enums.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PasswordRouterService {
  // register successful dialog
  void passwordUserSuccessfulDialog(
      BuildContext context, TextEditingController mail) {
    mail.clear();
    var alertDialog = AlertDialog(
      title: Icon(
        Icons.check,
        color: ColorBackgroundConstant.redDarker,
        size: 45,
      ),
      content: LabelMediumBlackText(
        text: PasswordStrings.passwordSuccessfulTitleText.value,
        textAlign: TextAlign.center,
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // register error dialog
  void passwordUserErrorDialog(
      BuildContext context, TextEditingController mail) {
    mail.clear();
    var alertDialog = AlertDialog(
      title: Icon(
        Icons.close,
        color: ColorBackgroundConstant.redDarker,
        size: 45,
      ),
      content: LabelMediumBlackText(
        text: PasswordStrings.passwordErrorTitleText.value,
        textAlign: TextAlign.center,
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }
}
