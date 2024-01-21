import 'package:flutter/material.dart';
import 'package:kuaforum/product/enums/logregpass_enums/register_enums.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: LabelMediumBlackText(
                text: RegisterStrings.loginText.value,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  routerService.loginViewNavigatorRouter(context);
                },
                child: LabelMediumMainColorText(
                  text: RegisterStrings.loginBtnText.value,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
