import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/view/appointmentcreate_view/appointmentcreate_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicelist/servicelist_view.dart';

class ServiceRouterService {
  // service list view router
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

  // appointment create view
  void appointmentCreateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentCreateView(
          data: data,
        ),
      ),
    );
  }
}
