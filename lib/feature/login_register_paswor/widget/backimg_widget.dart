import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/image_constant.dart';

class BackImgWidget extends StatelessWidget {
  const BackImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppLogRegImgsConstant.backImg.toJpg,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
