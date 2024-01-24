import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/home_enum/home_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView(
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
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          text: "Gönderi Detayı",
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: <Widget>[
          // post card
          buildPostCardWidget(
            context,
            widget.data,
          ),
        ],
      ),
    );
  }

  // post card
  Widget buildPostCardWidget(context, data) => Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              // profile top
              SizedBox(
                width: widget.maxWidth,
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
                              image:
                                  AssetImage(AppLogoConstant.appLogoRed.toPng),
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
                                width: widget.maxWidth,
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
                                width: widget.maxWidth,
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
                width: widget.maxWidth,
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
                      width: widget.maxWidth,
                      height: widget.dynamicHeight(0.3),
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
                    ),
              // comment button
              GestureDetector(
                onTap: () {
                  widget.routerService
                      .postDetailViewNavigatorRouter(context, data);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: widget.maxWidth,
                    height: widget.dynamicHeight(0.07),
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
                            text: HomeStrings.postCardCommentText.value,
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
}
