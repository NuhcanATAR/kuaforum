// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/mixin/loginbloc_mixin/loginbloc_mixin.dart';
import 'package:kuaforum/product/model/log_reg_pass_model/login_model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../product/extension/view_extension.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class MainLoginBase<T extends StatefulWidget> extends State<T>
    with LoginBlocMixin {
  // model service
  LoginServiceModel modelService = LoginServiceModel();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    loadUserEmailPassword();
    getConnnectivityStatus();
  }

  void loadUserEmailPassword() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      dynamic email = prefs.getString("email") ?? "";

      dynamic password = prefs.getString("password") ?? "";

      dynamic remeberMe = prefs.getBool("remember_me") ?? false;

      if (remeberMe) {
        setState(() {
          modelService.isRememberChecked = true;
        });
        modelService.emailController.text = email;
        modelService.passwordController.text = password;

        FirebaseAuth auth = FirebaseAuth.instance;
        User? user = auth.currentUser;

        if (user != null) {
          if (user.emailVerified) {
            String uid = user.uid;
            modelService.logger.i("Kullanıcı UID: $uid");

            routerService.loginLoadingViewRouter(context);
          } else {
            final snackBar = SnackBar(
              content: const Text('E-mail Adresinizi Doğrulayınız!'),
              action: SnackBarAction(
                label: 'Tamam',
                onPressed: () {},
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        } else {
          modelService.logger.i("Mevcut oturumda kullanıcı yok.");
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // connectivity status
  getConnnectivityStatus() => modelService.subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        modelService.isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
        if (!modelService.isDeviceConnected &&
            modelService.isAlertDialog == false) {
          showDialogBox();
          setState(() {
            modelService.isAlertDialog = true;
          });
        }
      });

  showDialogBox() => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.wifi_off_rounded,
            color: Colors.redAccent,
            size: 55,
          ),
          content: Text(
            'İnternet bağlantınız yok! Lütfen tekrar deneyiniz.',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => modelService.isAlertDialog = false);
                  modelService.isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!modelService.isDeviceConnected &&
                      modelService.isAlertDialog == false) {
                    showDialogBox();
                    setState(() => modelService.isAlertDialog = true);
                  }
                },
                child: Text(
                  'Tekrar Dene',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorBackgroundConstant.redDarker,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
}
