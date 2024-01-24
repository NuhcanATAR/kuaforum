import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/service_enum/service_detail_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget(
      {required this.data,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      height: dynamicHeight(0.1),
      child: Padding(
        padding: context.padding.low,
        child: Row(
          children: <Widget>[
            // service price
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: LabelMediumBlackBoldText(
                  text: "Hizmet Ücreti: ${data['SERVICEPRICE'].toString()}₺",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // appoıntment button
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: maxWidth,
                  height: dynamicHeight(0.06),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorBackgroundConstant.redDarker,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: LabelMediumWhiteText(
                      text: ServiceDetailStrings.appointmentText.value,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
