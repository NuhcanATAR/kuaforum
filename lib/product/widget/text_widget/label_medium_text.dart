import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/product/constants/color_constant.dart';

class LabelMediumBlackText extends StatelessWidget {
  const LabelMediumBlackText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium!.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}

class LabelMediumBlackBoldText extends StatelessWidget {
  const LabelMediumBlackBoldText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LabelMediumGreyText extends StatelessWidget {
  const LabelMediumGreyText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium!.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class LabelMediumWhiteText extends StatelessWidget {
  const LabelMediumWhiteText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

class LabelMediumMainColorText extends StatelessWidget {
  const LabelMediumMainColorText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium!
            .copyWith(color: ColorBackgroundConstant.redDarker),
      ),
    );
  }
}

class LabelMediumRedText extends StatelessWidget {
  const LabelMediumRedText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium!.copyWith(
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
