import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/home_enum/home_enum.dart';
import 'package:kuaforum/product/utility/database/main_view_db/home_db/home_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PopularityServiceListWidget extends StatelessWidget {
  const PopularityServiceListWidget(
      {required this.maxWidth,
      required this.dynamicWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});

  final dynamic maxWidth;
  final dynamic dynamicWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
          child: GestureDetector(
            onTap: () {
              routerService.searchViewNavigatorRouter(context);
            },
            child: Row(
              children: <Widget>[
                Expanded(
                  child: LabelMediumBlackText(
                    text: HomeStrings.serviceListContentTitleText.value,
                    textAlign: TextAlign.left,
                  ),
                ),
                LabelMediumMainColorText(
                  text: HomeStrings.serviceListContentNextBtnText.value,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
        // service list
        StreamBuilder<QuerySnapshot>(
          stream: HomeDB.BASICSERVICES.basicServicesList,
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
              return SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.43),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        child: SizedBox(
                          width: dynamicWidth(0.90),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  // image
                                  SizedBox(
                                    width: maxWidth,
                                    height: dynamicHeight(0.15),
                                    child: CachedNetworkImage(
                                      imageUrl: data['COVERIMG'].toString(),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Container(
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                  // title
                                  SizedBox(
                                    width: maxWidth,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          bottom: 5,
                                          top: 10),
                                      child: LabelMediumBlackBoldText(
                                        text: data['SERVICETITLE'],
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  // sub title
                                  SizedBox(
                                    width: maxWidth,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                      child: LabelMediumBlackText(
                                        text: data['SERVICESUBTITLE'],
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  // service duration
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          color:
                                              ColorBackgroundConstant.redDarker,
                                          size: 18,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: LabelMediumBlackText(
                                              text:
                                                  "${data['SERVICEDURATION']} ${data['SERVICEDURATIONTYPE']}",
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // button
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        left: 10,
                                        right: 10,
                                        bottom: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        routerService
                                            .serviceDetailViewNavigator(
                                                context, data);
                                      },
                                      child: SizedBox(
                                        width: maxWidth,
                                        height: dynamicHeight(0.05),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorBackgroundConstant
                                                .redDarker,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: LabelMediumWhiteText(
                                            text:
                                                "Fiyat ${data['SERVICEPRICE']}₺ / Hizmeti İncele",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
