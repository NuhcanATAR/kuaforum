import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget(
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
        obscureText: true,
        style: GoogleFonts.nunito(
          textStyle: contextkartal.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        controller: modelService.passwordController,
        validator: modelService.passwordValidator,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.password_outlined,
            color: Colors.black54,
            size: 18,
          ),
          border: InputBorder.none,
          hintText: "Şifre *",
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
