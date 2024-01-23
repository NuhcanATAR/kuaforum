// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/connectionerror_view/connectionerror_view.dart';
import 'package:kuaforum/product/model/main_view_model/profilecomplete_model/profilecomplete_model.dart';
import 'package:kuaforum/product/router/main_view_router/completeprofile_router/completeprofile_router.dart';
import 'package:kuaforum/product/utility/database/main_view_db/bottommenu_db/bottommenu_db.dart';
import 'package:logger/logger.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainCompleteProfileBase<T extends StatefulWidget>
    extends State<T> {
  // model service
  ProfileCompleteModelService modelService = ProfileCompleteModelService();
  // router service
  ProfileCompleteRouterService routerService = ProfileCompleteRouterService();
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  // profile update
  Future<void> profileCompleteUpdate(String phoneNumber, String city) async {
    await BottomMenuDB.USERS.userRefTable.set(
      {
        "PHONENUMBER": phoneNumber,
        "CITY": city,
      },
      SetOptions(merge: true),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      checkControl();
    });
  }

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      Logger().i("İnternet Bağlandı!!");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ConnectionErrorView(),
        ),
      );
    }
  }
}
