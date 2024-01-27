import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/profile/widget/accountsettingmenu_widget.dart';
import 'package:kuaforum/feature/main_view/profile/widget/appointmentmenu_widget.dart';
import 'package:kuaforum/feature/main_view/profile/widget/emailupdatemenu_widget.dart';
import 'package:kuaforum/feature/main_view/profile/widget/exitaccountmenu_widget.dart';
import 'package:kuaforum/feature/main_view/profile/widget/profilecard_widget.dart';
import 'package:kuaforum/product/utility/base/main_view_base/profile_base/profile_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends MainProfileBase<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumWhiteText(
          text: "Profil",
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // profile card
            buildProfileCardWidget,
            // appointments menu
            buildAppointmentMenuWidget,
            // profile setting
            buildProfileSettingMenuWidget,
            // email update
            buildEmailUpdateMenuWidget,
            // exit account
            buildExitAccountMenuWidget,
          ],
        ),
      ),
    );
  }

  // profile card
  Widget get buildProfileCardWidget => ProfileCardWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
  // appointments menu
  Widget get buildAppointmentMenuWidget => AppointmentMenuWidget(
        routerService: routerService,
      );
  // profile setting
  Widget get buildProfileSettingMenuWidget => AccountSettingMenuWidget(
        routerService: routerService,
      );
  // email update
  Widget get buildEmailUpdateMenuWidget => EmailUpdateMenuWidget(
        routerService: routerService,
      );

  // exit account
  Widget get buildExitAccountMenuWidget => ExitAccountMenuWidget(
        routerService: routerService,
      );
}
