import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/bottommenu_view.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/view/completeprofile_view.dart';
import 'package:kuaforum/product/utility/database/main_view_db/bottommenu_db/bottommenu_db.dart';

class ProfileControlView extends StatelessWidget {
  const ProfileControlView({Key? key}) : super(key: key);

  void navigateToDestination(BuildContext context, Map<String, dynamic> data) {
    if (data['CITY'] == "" && data['PHONENUMBER'] == "") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CompleteProfileView(),
          ),
          (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomMenuView(),
          ),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: BottomMenuDB.USERS.userRef,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            backgroundColor: Colors.white,
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Scaffold(
            backgroundColor: Colors.white,
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            navigateToDestination(context, data);
          });

          return Container();
        } else {
          return const Scaffold(
            backgroundColor: Colors.white,
          );
        }
      },
    );
  }
}
