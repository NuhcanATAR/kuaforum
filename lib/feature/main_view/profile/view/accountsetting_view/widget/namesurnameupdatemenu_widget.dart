import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class NameSurnameUpdateMenuWidget extends StatelessWidget {
  const NameSurnameUpdateMenuWidget(
      {required this.data,
      required this.routerService,
      required this.menuText,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;
  final String menuText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.nameSurnameUpdateViewNavigatorRouter(context, data);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: LabelMediumBlackText(
                text: menuText,
                textAlign: TextAlign.left,
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
    );
  }
}
