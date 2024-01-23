import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/enums/mainview_enums/home_enum/home_enum.dart';
import 'package:kuaforum/product/utility/database/main_view_db/home_db/home_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ServiceCategoryListWidget extends StatelessWidget {
  const ServiceCategoryListWidget(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        buildTitleWidget(context),
        // service category list
        buildServiceCategoryListWidget,
      ],
    );
  }

  // title
  Widget buildTitleWidget(context) => Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
        child: GestureDetector(
          onTap: () {
            routerService.serviceCategoryListViewNavigatorRouter(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: LabelMediumBlackText(
                    text: HomeStrings.categoryTitleText.value,
                    textAlign: TextAlign.left,
                  ),
                ),
                LabelMediumMainColorText(
                  text: HomeStrings.categoryNextBtnText.value,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
      );

  // service category list
  Widget get buildServiceCategoryListWidget => SizedBox(
        width: maxWidth,
        height: dynamicHeight(0.07),
        child: StreamBuilder<QuerySnapshot>(
          stream: HomeDB.SERVICECATEGORY.serviceCategory,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const SizedBox();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return buildCategoryCardWidget(context, data);
                }).toList(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      );

  // category card
  Widget buildCategoryCardWidget(context, data) => Padding(
        padding: const EdgeInsets.only(left: 5),
        child: GestureDetector(
          onTap: () {
            routerService.serviceListViewNavigatorRouter(context, data);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CachedNetworkImage(
                      imageUrl: data['ICON'].toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const SizedBox(),
                      errorWidget: (context, url, error) => const SizedBox(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: LabelMediumBlackText(
                      text: data['CATEGORYNAME'],
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
