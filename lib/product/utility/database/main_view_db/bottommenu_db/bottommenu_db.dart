// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuaforum/product/utility/service/firebase_service.dart';

enum BottomMenuDB {
  USERS;

  Future<DocumentSnapshot<Map<String, dynamic>>> get userRef =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .get();

  DocumentReference<Map<String, dynamic>> get userRefTable =>
      FirebaseFirestore.instance.collection(name).doc(FirebaseService().authID);
}
