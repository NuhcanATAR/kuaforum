import 'package:cloud_firestore/cloud_firestore.dart';

enum AppointmentDB {
  APPOINTMENTS;

  // one time query parameter
  CollectionReference get appointmentRef =>
      FirebaseFirestore.instance.collection(name);
}
