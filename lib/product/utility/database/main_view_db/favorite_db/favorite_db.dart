import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuaforum/product/utility/service/firebase_service.dart';

enum FavoriteDB {
  FAVORITESERVICES,
  BASICSERVICES;

  // one time query parameter
  Future<DocumentSnapshot<Map<String, dynamic>>> basicServiceRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance.collection(name).doc(data['SERVICEID']).get();

  // list query parameter
  Stream<QuerySnapshot> get favoriteListQuery => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("SERVICELIST")
      .orderBy("DATE", descending: true)
      .snapshots();
}
