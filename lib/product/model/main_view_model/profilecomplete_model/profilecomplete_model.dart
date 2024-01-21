import 'package:flutter/material.dart';

List<String> cityList = <String>[
  "Ankara",
  "Çorum",
  "Amasya",
  "Samsun",
  "İstanbul",
];

class ProfileCompleteModelService {
  // form keys
  final formPhoneNumberKey = GlobalKey<FormState>();
  final formSelectCityKey = GlobalKey<FormState>();

  // controller
  late TextEditingController phoneNumberController = TextEditingController();

  late String selectCity = cityList.first;

  // validator
  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }
}
