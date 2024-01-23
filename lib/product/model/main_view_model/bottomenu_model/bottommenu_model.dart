import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/setting/setting_view.dart';
import 'package:kuaforum/feature/main_view/favorite/favorite_view.dart';
import 'package:kuaforum/feature/main_view/home/home_view.dart';
import 'package:kuaforum/feature/main_view/profile/profile_view.dart';

class BottomMenuModelService {
  List<Widget> mainViewList = <Widget>[
    const FavoriteView(),
    const SettingView(),
    const HomeView(),
    const ProfileView(),
  ];
  int selectedViewIndex = 2;
}
