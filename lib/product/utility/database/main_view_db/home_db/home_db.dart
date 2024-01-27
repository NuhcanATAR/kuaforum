// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuaforum/product/utility/service/firebase_service.dart';

enum HomeDB {
  USERS,
  ADVERTS,
  SERVICECATEGORY,
  POSTS,
  COMMENTS,
  BASICSERVICES;

  // one time query parameter
  Future<DocumentSnapshot<Map<String, dynamic>>> get userRef =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .get();

  Future<DocumentSnapshot<Map<String, dynamic>>> userRefTable(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance.collection(name).doc(data['USERID']).get();

  CollectionReference get userCommentRef =>
      FirebaseFirestore.instance.collection(name);

  Future<DocumentSnapshot<Map<String, dynamic>>> basicServiceRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(data['BASICSERVICESID'])
          .get();

  // list query parameter
  Stream<QuerySnapshot> get sliderList => FirebaseFirestore.instance
      .collection(name)
      .where("ACTIVE", isEqualTo: true)
      .snapshots();

  Stream<QuerySnapshot> get serviceCategory => FirebaseFirestore.instance
      .collection(name)
      .where("ACTIVE", isEqualTo: true)
      .snapshots();

  Stream<QuerySnapshot> get basicServicesList => FirebaseFirestore.instance
      .collection(name)
      .where("ACTIVE", isEqualTo: true)
      .where("POPULARITYSTATUS", isEqualTo: true)
      .snapshots();

  Stream<QuerySnapshot> get postList => FirebaseFirestore.instance
      .collection(name)
      .orderBy("DATE", descending: true)
      .snapshots();

  Stream<QuerySnapshot> get commentListQuery => FirebaseFirestore.instance
      .collection(name)
      .orderBy("DATE", descending: true)
      .snapshots();
}
