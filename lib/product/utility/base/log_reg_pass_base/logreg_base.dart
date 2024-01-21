import 'package:flutter/material.dart';
import 'package:kuaforum/product/router/log_reg_pass_router/logreg_router.dart';

import '../../../../product/extension/view_extension.dart';

abstract class MainLogRegBase<T extends StatefulWidget> extends State<T> {
  // router service
  LoginRegisterRouterService routerService = LoginRegisterRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;
}
