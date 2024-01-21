import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegisterServiceModel {
  // form key
  final formRegisterKey = GlobalKey<FormState>();

  // controller

  late TextEditingController nameController = TextEditingController();
  late TextEditingController surnameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  // validator
  String? nameValidator(String? nameVal) {
    if (nameVal == null || nameVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? surnameValidator(String? surnameVal) {
    if (surnameVal == null || surnameVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? passVal) {
    if (passVal == null || passVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  // connectivity controller
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertDialog = false;

  // input
  bool isEmailinp = false;
  bool isPasswordinp = false;

  // password open / close
  bool isPassObscured = true;

  // logger
  dynamic logger = Logger();
}
