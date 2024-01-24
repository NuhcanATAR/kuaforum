// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuaforum/product/utility/service/firebase_service.dart';

enum ServiceDB {
  SERVICECATEGORY,
  FAVORITESERVICES,
  ADDITIONALSERVICES;

  // one time query parameter
  Future<DocumentSnapshot<Map<String, dynamic>>> serviceCategoryRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance.collection(name).doc(data['CATEGORYID']).get();

  CollectionReference get favoriteService => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("SERVICELIST");

  Future<DocumentSnapshot<Map<String, dynamic>>> favoriteServiceRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("SERVICELIST")
          .doc(data['ID'])
          .get();

  // list query parameter
  Stream<QuerySnapshot> additionalServiceList(Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .where("BASICSERVICESID", isEqualTo: data['ID'])
          .snapshots();
}
