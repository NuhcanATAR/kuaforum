import 'package:flutter/material.dart';

List<String> paymentTypeList = <String>[
  "Kart ile Ödeme",
  "Nakit Ödeme",
];

class AppointmentCreateModelService {
  // date
  DateTime selectedDate = DateTime.now();

  // select payment value
  late String selectPaymentTypeValue = paymentTypeList.first;

  // controller
  late TextEditingController appointmentExplanationController =
      TextEditingController();
}
