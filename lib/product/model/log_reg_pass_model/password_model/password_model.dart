import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ResetPasswordServiceModel {
  // form key
  final formResPassKey = GlobalKey<FormState>();

  // controller
  late TextEditingController emailController = TextEditingController();

  // validator

  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  // input
  bool isEmailinp = false;

  // connectivity controller
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertDialog = false;

  // logger
  dynamic logger = Logger();
}
