import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

import '../../../../product/enums/mainview_enums/profile_enum/profile_enum.dart';

class AccountSettingMenuWidget extends StatelessWidget {
  const AccountSettingMenuWidget({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          routerService.accountSettingViewNavigatorRouter(context);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.settings_outlined,
                  color: ColorBackgroundConstant.redDarker,
                  size: 18,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: LabelMediumBlackBoldText(
                      text: ProfileStrings.accountSettingMenuText.value,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorBackgroundConstant.redDarker,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
