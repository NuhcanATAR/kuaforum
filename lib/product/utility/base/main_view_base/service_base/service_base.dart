import 'package:flutter/material.dart';
import 'package:kuaforum/product/model/main_view_model/servicedetail_model/servicedetail_model.dart';
import 'package:kuaforum/product/router/main_view_router/service_router/service_router.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainServiceBase<T extends StatefulWidget> extends State<T> {
  // router service
  ServiceRouterService routerService = ServiceRouterService();
  // model service
  ServiceDetailModelService modelService = ServiceDetailModelService();
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;
}
