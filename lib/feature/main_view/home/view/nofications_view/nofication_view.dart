import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class NoficationView extends StatelessWidget {
  const NoficationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.redDarker,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Bildirimler",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
