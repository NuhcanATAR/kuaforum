import 'package:flutter/material.dart';
import 'package:kuaforum/feature/login_register_paswor/login/login_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/logregpass_enums/register_enums.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class RegisterServiceRouter {
  // login router
  void loginViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  // register successful dialog
  void registerUserSuccessfulDialog(
      BuildContext context,
      TextEditingController name,
      TextEditingController surname,
      TextEditingController mail,
      TextEditingController password) {
    name.clear();
    surname.clear();
    mail.clear();
    password.clear();
    var alertDialog = AlertDialog(
      title: Icon(
        Icons.check,
        color: ColorBackgroundConstant.redDarker,
        size: 45,
      ),
      content: LabelMediumBlackText(
        text: RegisterStrings.registerSuccessfulTitleText.value,
        textAlign: TextAlign.center,
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // register error dialog
  void registerUserErrorDialog(
      BuildContext context,
      TextEditingController name,
      TextEditingController surname,
      TextEditingController mail,
      TextEditingController password) {
    name.clear();
    surname.clear();
    mail.clear();
    password.clear();
    var alertDialog = AlertDialog(
      title: Icon(
        Icons.close,
        color: ColorBackgroundConstant.redDarker,
        size: 45,
      ),
      content: LabelMediumBlackText(
        text: RegisterStrings.registerErrorTitleText.value,
        textAlign: TextAlign.center,
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }
}
