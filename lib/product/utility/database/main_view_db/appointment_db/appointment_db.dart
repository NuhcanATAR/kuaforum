// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum AppointmentDB {
  BASICSERVICES,
  EVALUATION,
  APPOINTMENTS;

  // one time query parameter
  CollectionReference get appointmentRef =>
      FirebaseFirestore.instance.collection(name);

  DocumentReference<Map<String, dynamic>> appointmentRefTable(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance.collection(name).doc(data['ID']);

  Future<DocumentSnapshot<Map<String, dynamic>>> basicServiceRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(data['BASICSERVICESID'])
          .get();

  CollectionReference get evaluationRef =>
      FirebaseFirestore.instance.collection(name);

  // list query parameter
  Stream<QuerySnapshot> get appointmentListQuery => FirebaseFirestore.instance
      .collection(name)
      .orderBy("DATE", descending: true)
      .snapshots();
}
