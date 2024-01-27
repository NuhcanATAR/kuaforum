import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/widget/cityupdatemenu_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/widget/namesurnameupdatemenu_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/widget/phonenumberupdatemenu_widget.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/profile_enum/profile_enum.dart';
import 'package:kuaforum/product/utility/database/main_view_db/profile_db/profile_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AccountSettingView extends StatelessWidget {
  const AccountSettingView({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorBackgroundConstant.redDarker,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Hesap Ayarları",
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: ProfileDB.USERS.userRef,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: context.padding.normal,
              child: ListView(
                children: <Widget>[
                  // name surname update menu
                  buildNameSurnameUpdateMenuWidget(context, data),
                  // phone number update menu
                  buildPhoneNumberUpdateMenuWidget(context, data),
                  // city update menu
                  buildCityUpdateMenuWidget(context, data),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  // name surname update menu
  Widget buildNameSurnameUpdateMenuWidget(context, Map<String, dynamic> data) =>
      NameSurnameUpdateMenuWidget(
        routerService: routerService,
        menuText: ProfileStrings.nameSurnameUpdateMenuText.value,
        data: data,
      );

  // phone number update menu
  Widget buildPhoneNumberUpdateMenuWidget(context, Map<String, dynamic> data) =>
      PhoneNumberUpdateMenuWidget(
        routerService: routerService,
        menuText: ProfileStrings.phoneNumberUpdateMenuText.value,
        data: data,
      );

  // city update menu
  Widget buildCityUpdateMenuWidget(context, Map<String, dynamic> data) =>
      CityUpdateMenuWidget(
        routerService: routerService,
        menuText: ProfileStrings.cityUpdateMenuText.value,
        data: data,
      );
}
