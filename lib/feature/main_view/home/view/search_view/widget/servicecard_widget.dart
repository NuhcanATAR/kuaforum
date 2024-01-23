import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/utility/database/main_view_db/search_db/search_db.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget(
      {required this.data,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return buildCardWidget(context, data);
  }

  // card widget
  Widget buildCardWidget(context, data) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Card(
          child: SizedBox(
            width: maxWidth,
            height: dynamicHeight(0.17),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                children: <Widget>[
                  // service image
                  buildServiceImgWidget(context, data),
                  // service information
                  buildServiceInformationWidget(context, data),
                ],
              ),
            ),
          ),
        ),
      );

  // service image
  Widget buildServiceImgWidget(context, data) => Flexible(
        fit: FlexFit.tight,
        flex: 2,
        child: GestureDetector(
          onTap: () {
            routerService.serviceDetailViewNavigatorRouter(context, data);
          },
          child: CachedNetworkImage(
            imageUrl: data['COVERIMG'],
            imageBuilder: (context, imageProvider) => Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              color: Colors.grey.withOpacity(0.1),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
        ),
      );

  // service information
  Widget buildServiceInformationWidget(context, data) => Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // category
                SizedBox(
                  width: maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: FutureBuilder<DocumentSnapshot>(
                      future:
                          SearchDB.SERVICECATEGORY.serviceMainCategoryRef(data),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const SizedBox();
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return const SizedBox();
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> dataCategory =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return LabelMediumBlackText(
                            text: dataCategory['CATEGORYNAME'],
                            textAlign: TextAlign.left,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
                // title
                SizedBox(
                  width: maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: BodyMediumBlackBoldText(
                      text: data['SERVICETITLE'],
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // sub title
                SizedBox(
                  width: maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: LabelMediumBlackText(
                      text: data['SERVICESUBTITLE'],
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // service duration
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 5, top: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        color: ColorBackgroundConstant.redDarker,
                        size: 18,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 10),
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
              ],
            ),
          ),
        ),
      );
}
