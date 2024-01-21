import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/model/log_reg_pass_model/register_model/register_model.dart';
import 'package:kuaforum/product/router/log_reg_pass_router/register_router/register_router.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainRegisterBase<T extends StatefulWidget> extends State<T> {
  // model service
  RegisterServiceModel modelService = RegisterServiceModel();
  // router service
  RegisterServiceRouter routerService = RegisterServiceRouter();
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    getConnnectivityStatus();
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
