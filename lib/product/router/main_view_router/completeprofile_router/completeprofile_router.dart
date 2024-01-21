import 'package:flutter/material.dart';
import 'package:kuaforum/feature/login_register_paswor/login/view/loginloading_view.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/view/selectcity_view/selectcity_view.dart';

class ProfileCompleteRouterService {
  void selectCityViewNavigatorRouter(
      BuildContext context, TextEditingController phoneNumberValue) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectCityView(
          phoneNumberValue: phoneNumberValue.text,
        ),
      ),
    );
  }

  void loginLoadingViewNavigatorRouter(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginLoadingView(),
        ),
        (Route<dynamic> route) => false);
  }
}
