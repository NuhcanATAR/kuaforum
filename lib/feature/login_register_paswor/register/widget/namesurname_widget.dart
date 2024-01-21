import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuaforum/product/enums/logregpass_enums/register_enums.dart';

class NameSurnameWidget extends StatelessWidget {
  const NameSurnameWidget(
      {required this.contextkartal, required this.modelService, super.key});

  final dynamic contextkartal;
  final dynamic modelService;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
              right: 5,
            ),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: TextFormField(
              style: GoogleFonts.nunito(
                textStyle: contextkartal.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              controller: modelService.nameController,
              validator: modelService.nameValidator,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black54,
                  size: 18,
                ),
                border: InputBorder.none,
                hintText: RegisterStrings.nameText.value,
                hintStyle: GoogleFonts.nunito(
                  textStyle: contextkartal.textTheme.labelMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 5,
            ),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: TextFormField(
              style: GoogleFonts.nunito(
                textStyle: contextkartal.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              controller: modelService.surnameController,
              validator: modelService.surnameValidator,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black54,
                  size: 18,
                ),
                border: InputBorder.none,
                hintText: RegisterStrings.surnameText.value,
                hintStyle: GoogleFonts.nunito(
                  textStyle: contextkartal.textTheme.labelMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
