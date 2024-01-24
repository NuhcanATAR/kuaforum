import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/home_enum/home_enum.dart';
import 'package:kuaforum/product/utility/database/main_view_db/home_db/home_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: HomeDB.POSTS.postList,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.docs.isNotEmpty) {
          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              if (data['ACTIVE'] == true) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        // profile top
                        SizedBox(
                          width: maxWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                // profile image
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorBackgroundConstant.redDarker,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            AppLogoConstant.appLogoRed.toPng),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                // user name, date
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      children: <Widget>[
                                        // user name
                                        SizedBox(
                                          width: maxWidth,
                                          child: const Padding(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: LabelMediumBlackBoldText(
                                              text: "Kuaförüm",
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        // date
                                        SizedBox(
                                          width: maxWidth,
                                          child: LabelMediumGreyText(
                                            text:
                                                "${data['POSTDAY']}.${data['POSTMONTH']}.${data['POSTYEAR']}",
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // explanation
                        SizedBox(
                          width: maxWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: LabelMediumBlackText(
                              text: data['EXPLANATION'],
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        // image
                        data['IMG'] == ""
                            ? const SizedBox()
                            : SizedBox(
                                width: maxWidth,
                                height: dynamicHeight(0.3),
                                child: CachedNetworkImage(
                                  imageUrl: data['IMG'].toString(),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
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
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        // comment button
                        GestureDetector(
                          onTap: () {
                            routerService.postDetailViewNavigatorRouter(context,
                                data, routerService, maxWidth, dynamicHeight);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              width: maxWidth,
                              height: dynamicHeight(0.07),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Icon(
                                    Icons.comment_outlined,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: LabelMediumGreyText(
                                      text:
                                          HomeStrings.postCardCommentText.value,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }).toList(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
