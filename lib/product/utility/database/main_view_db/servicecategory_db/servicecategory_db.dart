// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum ServiceCategoryDB {
  SERVICECATEGORY,
  BASICSERVICES;

  // one time query parameter

  // list query parameter
  Stream<QuerySnapshot> get serviceCategoryList => FirebaseFirestore.instance
      .collection(name)
      .where("ACTIVE", isEqualTo: true)
      .snapshots();

  Stream<QuerySnapshot> serviceList(Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .where("CATEGORYID", isEqualTo: data['ID'])
          .snapshots();
}
