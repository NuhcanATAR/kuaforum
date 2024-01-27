import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/widget/popularityservicelist_widget.dart';
import 'package:kuaforum/feature/main_view/home/widget/postlist_widget.dart';
import 'package:kuaforum/feature/main_view/home/widget/search_widget.dart';
import 'package:kuaforum/feature/main_view/home/widget/servicecategorylist_widget.dart';
import 'package:kuaforum/feature/main_view/home/widget/sliderbannerlist_widget.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/home_enum/home_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/home_base/home_base.dart';
import 'package:kuaforum/product/utility/database/main_view_db/home_db/home_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends MainHomeBase<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: <Widget>[
            // profile image
            SizedBox(
              width: 40,
              height: 40,
              child: Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
            ),
            // name surname
            Expanded(
              child: Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: <Widget>[
                      // welcome text
                      SizedBox(
                        width: maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: LabelMediumGreyText(
                            text: HomeStrings.welcomeText.value,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),

                      // name surname
                      FutureBuilder<DocumentSnapshot>(
                        future: HomeDB.USERS.userRef,
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const SizedBox();
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return const SizedBox();
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return SizedBox(
                              width: maxWidth,
                              child: LabelMediumBlackBoldText(
                                text: "${data['NAME']} ${data['SURNAME']}",
                                textAlign: TextAlign.left,
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              routerService.noficationViewNavigatorRouter(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications,
                color: ColorBackgroundConstant.redDarker,
                size: 21,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          // search
          buildSearchWidget,
          // slider banner
          buildSliderBannerWidget,
          // service category
          buildServiceCategoryWidget,
          // popularity service
          buildPopularityServie,
          // post list
          buildPostListWidget,
        ],
      ),
    );
  }

  // search
  Widget get buildSearchWidget => SearchWidget(
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );

  // slider banner
  Widget get buildSliderBannerWidget => SliderBannerListWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );

  // service category
  Widget get buildServiceCategoryWidget => ServiceCategoryListWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );

  // popularity service
  Widget get buildPopularityServie => PopularityServiceListWidget(
        maxWidth: maxWidth,
        dynamicWidth: dynamicWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );

  // post list
  Widget get buildPostListWidget => PostListWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );
}
