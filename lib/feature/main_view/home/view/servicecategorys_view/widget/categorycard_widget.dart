import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget(
      {required this.routerService, required this.data, super.key});

  final dynamic routerService;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.serviceListViewNavigatorRouter(context, data);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 35,
                height: 35,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: LabelMediumBlackText(
                    text: data['CATEGORYNAME'],
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: ColorBackgroundConstant.redDarker,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
