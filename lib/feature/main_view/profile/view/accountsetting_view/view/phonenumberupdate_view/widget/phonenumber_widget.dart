import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class PhoneNumberInputWidget extends StatelessWidget {
  const PhoneNumberInputWidget(
      {required this.modelService,
      required this.phoneNumberController,
      super.key});

  final dynamic modelService;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: phoneNumberController,
        validator: modelService.phoneNumberValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
