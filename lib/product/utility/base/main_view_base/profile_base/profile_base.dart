import 'package:flutter/material.dart';
import 'package:kuaforum/product/router/main_view_router/profile_router/profile_router.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainProfileBase<T extends StatefulWidget> extends State<T> {
  // router service
  ProfileRouterService routerService = ProfileRouterService();
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;
}
