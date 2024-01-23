import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/model/main_view_model/bottomenu_model/bottommenu_model.dart';

class BottomMenuView extends StatefulWidget {
  const BottomMenuView({super.key});

  @override
  State<BottomMenuView> createState() => _BottomMenuViewState();
}

class _BottomMenuViewState extends State<BottomMenuView> {
  BottomMenuModelService serviceModel = BottomMenuModelService();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: serviceModel.mainViewList[serviceModel.selectedViewIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              serviceModel.selectedViewIndex = index;
            });
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          selectedIndex: serviceModel.selectedViewIndex,
          height: 80,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.favorite,
                color: ColorBackgroundConstant.redDarker,
                size: 21,
              ),
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.settings,
                color: ColorBackgroundConstant.redDarker,
                size: 21,
              ),
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: ColorBackgroundConstant.redDarker,
                size: 21,
              ),
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.account_circle,
                color: ColorBackgroundConstant.redDarker,
                size: 21,
              ),
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Uygulamadan Çıkmakmı İstiyorsun?",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          child: const Text("Evet"),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Hayır",
                            style: TextStyle(color: Colors.black)),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
