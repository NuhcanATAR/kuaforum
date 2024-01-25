import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/view/appointmentsuccess_view/appointmentsuccess_view.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/view/appointmentsuccess_view/loadingsuccess_view.dart';

class AppointmentCreateRouterService {
  // appointment loading router
  void appointmentLoadingViewNavigatorRouter(BuildContext context,
      dynamic routerService, dynamic maxWidth, dynamic dynamicHeight) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoadingSuccessView(
            routerService: routerService,
            maxWidth: maxWidth,
            dynamicHeight: dynamicHeight,
          ),
        ),
        (Route<dynamic> route) => false);
  }

  // appointment success view
  void appointmentSuccessViewNavigatorRouter(
      BuildContext context, dynamic maxWidth, dynamic dynamicHeight) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AppointmentSuccessView(
            maxWidth: maxWidth,
            dynamicHeight: dynamicHeight,
          ),
        ),
        (Route<dynamic> route) => false);
  }
}
