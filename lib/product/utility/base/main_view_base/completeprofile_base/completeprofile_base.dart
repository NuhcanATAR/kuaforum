import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/model/main_view_model/profilecomplete_model/profilecomplete_model.dart';
import 'package:kuaforum/product/router/main_view_router/completeprofile_router/completeprofile_router.dart';
import 'package:kuaforum/product/utility/database/main_view_db/bottommenu_db/bottommenu_db.dart';
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
}
