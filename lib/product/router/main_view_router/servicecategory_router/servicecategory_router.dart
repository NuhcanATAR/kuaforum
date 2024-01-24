import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/servicedetail_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicelist/servicelist_view.dart';

class ServiceCategoryRouterService {
  // service list view
  void serviceListViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceListView(
          data: data,
        ),
      ),
    );
  }

  // service detail view router
  void serviceDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDetailView(
          data: data,
        ),
      ),
    );
  }
}
