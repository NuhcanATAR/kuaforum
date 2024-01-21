import 'package:flutter/material.dart';
import 'package:kuaforum/product/enums/logregpass_enums/login_enums.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class LoginRegisterButtonWidget extends StatelessWidget {
  const LoginRegisterButtonWidget({required this.routerService, super.key});

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
                text: LoginStrings.registerText.value,
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
                  routerService.registerViewNavigatorRouter(context);
                },
                child: LabelMediumMainColorText(
                  text: LoginStrings.registerBtnText.value,
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
