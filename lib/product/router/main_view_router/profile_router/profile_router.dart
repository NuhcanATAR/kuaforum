import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/accountsetting_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/appointmentlist_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/emailupdate_view/emailupdate_view.dart';

class ProfileRouterService {
  // appointment list view
  void appointmentListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AppointmentListView(),
      ),
    );
  }

  // account setting view
  void accountSettingViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AccountSettingView(),
      ),
    );
  }

  // email update
  void emailUpdateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailUpdateView(),
      ),
    );
  }

  // exit account dialog
  void exitAccountDialog(BuildContext context) {}
}
