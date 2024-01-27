// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/feature/login_register_paswor/login/login_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/accountsetting_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/cityupdate_view/cityupdate_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/namesurnameupdate_view/namesurnameupdate_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/phonenumberupdate_view/phonenumberupdate_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/appointmentlist_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/emailupdate_view/emailupdate_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRouterService {
  // appointment list view
  void appointmentListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AppointmentListView(),
      ),
    );
  }

  // account setting view
  void accountSettingViewNavigatorRouter(
      BuildContext context, dynamic routerService) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AccountSettingView(routerService: routerService),
      ),
    );
  }

  // email update
  void emailUpdateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailUpdateView(),
      ),
    );
  }

  // name surname update view
  void nameSurnameUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NameSurnameUpdateView(
          data: data,
        ),
      ),
    );
  }

  // phone number update view
  void phoneNumberUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhoneNumberUpdateView(
          data: data,
        ),
      ),
    );
  }

  // city update view
  void cityUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CityUpdateView(
          data: data,
        ),
      ),
    );
  }

  // exit account dialog
  void exitAccountDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: const Padding(
        padding: EdgeInsets.all(5),
        child: LabelMediumBlackBoldText(
          text: "Çıkış Yapmak İstediğinize Eminmisiniz?",
          textAlign: TextAlign.center,
        ),
      ),
      content: const Padding(
        padding: EdgeInsets.all(5),
        child: LabelMediumGreyText(
          text:
              "Çıkış yaptığınız zaman oturumunuz kapatılır ve tekrar giriş yapmak zorunda kalırsınız!",
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool("remember_me", false);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
                (Route<dynamic> route) => false);
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorBackgroundConstant.redDarker,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: const LabelMediumWhiteText(
              text: "Evet Çıkış Yap",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: const LabelMediumWhiteText(
              text: "Hayır",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }
}
