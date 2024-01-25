import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PostCardSubWidget extends StatelessWidget {
  const PostCardSubWidget(
      {required this.data,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          // profile top
          buildProfileTopWidget,
          // explanation
          buildExplanationWidget,
          // image
          buildImgWidget,
        ],
      ),
    );
  }

  // profile top
  Widget get buildProfileTopWidget => SizedBox(
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
                      image: AssetImage(AppLogoConstant.appLogoRed.toPng),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // user name, date
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
      );

  // explanation
  Widget get buildExplanationWidget => SizedBox(
        width: maxWidth,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: LabelMediumBlackText(
            text: data['EXPLANATION'],
            textAlign: TextAlign.left,
          ),
        ),
      );

  // image
  Widget get buildImgWidget => data['IMG'] == ""
      ? const SizedBox()
      : SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.3),
          child: CachedNetworkImage(
            imageUrl: data['IMG'].toString(),
            imageBuilder: (context, imageProvider) => Container(
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
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
          ),
        );
}
