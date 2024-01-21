import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/view/completeprofile_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/model/main_view_model/bottomenu_model/bottommenu_model.dart';
import 'package:kuaforum/product/utility/database/main_view_db/bottommenu_db/bottommenu_db.dart';

class BottomMenuView extends StatefulWidget {
  const BottomMenuView({super.key});

  @override
  State<BottomMenuView> createState() => _BottomMenuViewState();
}

class _BottomMenuViewState extends State<BottomMenuView> {
  BottomMenuModelService serviceModel = BottomMenuModelService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: BottomMenuDB.USERS.userRef,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const SizedBox();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (data['CITY'] == "" && data['PHONENUMBER'] == "") {
            return const CompleteProfileView();
          } else {
            return Scaffold(
              body: serviceModel.mainViewList[serviceModel.selectedViewIndex],
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {
                  setState(() {
                    serviceModel.selectedViewIndex = index;
                  });
                },
                backgroundColor: Colors.white,
                indicatorColor: Colors.transparent,
                selectedIndex: serviceModel.selectedViewIndex,
                height: 80,
                destinations: <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.favorite,
                      color: ColorBackgroundConstant.redDarker,
                      size: 21,
                    ),
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                      size: 21,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.message,
                      color: ColorBackgroundConstant.redDarker,
                      size: 21,
                    ),
                    icon: const Icon(
                      Icons.message_outlined,
                      color: Colors.grey,
                      size: 21,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home,
                      color: ColorBackgroundConstant.redDarker,
                      size: 21,
                    ),
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                      size: 21,
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.account_circle,
                      color: ColorBackgroundConstant.redDarker,
                      size: 21,
                    ),
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.grey,
                      size: 21,
                    ),
                    label: '',
                  ),
                ],
              ),
            );
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
