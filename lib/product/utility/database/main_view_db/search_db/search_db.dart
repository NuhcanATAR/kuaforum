import 'package:cloud_firestore/cloud_firestore.dart';

enum SearchDB {
  SERVICECATEGORY,
  BASICSERVICES;

  // one time query parameter
  Future<DocumentSnapshot<Map<String, dynamic>>> serviceMainCategoryRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance.collection(name).doc(data['CATEGORYID']).get();

  // list query parameter
  Stream<QuerySnapshot> get serviceList => FirebaseFirestore.instance
      .collection(name)
      .orderBy("DATE", descending: true)
      .snapshots();
}
