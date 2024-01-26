import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/servicedetail_view.dart';

class FavoriteRouterService {
  // service detail view
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
