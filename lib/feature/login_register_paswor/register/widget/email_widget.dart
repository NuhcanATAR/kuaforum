import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuaforum/product/enums/logregpass_enums/register_enums.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget(
      {required this.contextkartal, required this.modelService, super.key});

  final dynamic contextkartal;
  final dynamic modelService;

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
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.email_outlined,
            color: Colors.black54,
            size: 18,
          ),
          border: InputBorder.none,
          hintText: RegisterStrings.emailText.value,
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
