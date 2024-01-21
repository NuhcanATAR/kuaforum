import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuaforum/product/enums/logregpass_enums/password_enums.dart';

class PasswordMailWidget extends StatelessWidget {
  const PasswordMailWidget(
      {required this.modelService, required this.contextkartal, super.key});

  final dynamic modelService;
  final dynamic contextkartal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
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
        controller: modelService.emailController,
        validator: modelService.emailValidator,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.email_outlined,
            color: Colors.black54,
            size: 18,
          ),
          border: InputBorder.none,
          hintText: PasswordStrings.emailText.value,
          hintStyle: GoogleFonts.nunito(
            textStyle: contextkartal.textTheme.labelMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
