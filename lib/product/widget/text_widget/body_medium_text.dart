import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class BodyMediumBlackText extends StatelessWidget {
  const BodyMediumBlackText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium!.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}

class BodyMediumBlackBoldText extends StatelessWidget {
  const BodyMediumBlackBoldText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
