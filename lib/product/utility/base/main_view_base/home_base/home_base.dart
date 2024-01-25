// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/connectionerror_view/connectionerror_view.dart';
import 'package:kuaforum/product/model/main_view_model/post_model/post_model.dart';
import 'package:kuaforum/product/router/main_view_router/home_router/home_router.dart';
import 'package:logger/logger.dart';
import '../../../../../product/extension/view_extension.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class MainHomeBase<T extends StatefulWidget> extends State<T> {
  // router service
  HomeRouterService routerService = HomeRouterService();
  // post model
  PostModelService postModelService = PostModelService();
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

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
