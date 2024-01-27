import 'package:flutter/material.dart';

List<String> cityList = <String>[
  "Çorum",
  "Ankara",
  "Kırıkkale",
  "İstanbul",
  "Çanakkale",
];

class ProfileModelService {
  // form key
  final formUpdateKey = GlobalKey<FormState>();

  late String cityValue = cityList.first;

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

  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }
}
