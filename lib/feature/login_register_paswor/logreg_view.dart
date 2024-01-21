import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/login_register_paswor/widget/backimg_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/widget/loginbtn_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/widget/registerbtn_widget.dart';
import 'package:kuaforum/feature/login_register_paswor/widget/title_subtitle_widget.dart';
import 'package:kuaforum/product/utility/base/log_reg_pass_base/logreg_base.dart';

class LogRegView extends StatefulWidget {
  const LogRegView({super.key});

  @override
  State<LogRegView> createState() => _LogRegViewState();
}

class _LogRegViewState extends MainLogRegBase<LogRegView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: context.padding.horizontalNormal,
        child: Column(
          children: <Widget>[
            // back img
            buildBackImgWiget,
            // title & sub title
            buildTitleSubTitleWidget,
            // login button
            buildLoginButtonWidget,
            // register
            buildRegisterButtonWidget,
          ],
        ),
      ),
    );
  }

  // back img
  Widget get buildBackImgWiget => const BackImgWidget();

  // title & sub title
  Widget get buildTitleSubTitleWidget => const TitleSubTitleWidget();

  // login button
  Widget get buildLoginButtonWidget => LoginButtonWidget(
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // register button
  Widget get buildRegisterButtonWidget => RegisterButtonWidget(
        routerService: routerService,
      );
}
