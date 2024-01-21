import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/string_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(5),
            child: LabelMediumBlackText(
              text: LogRegViewConstant.registerText,
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () {
              routerService.registerViewNavigatorRouter(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: LabelMediumMainColorText(
                text: LogRegViewConstant.registerBtnText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
