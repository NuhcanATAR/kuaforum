import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/utility/database/main_view_db/home_db/home_db.dart';

class SliderBannerListWidget extends StatelessWidget {
  const SliderBannerListWidget(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});

  final dynamic dynamicHeight;
  final dynamic maxWidth;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SizedBox(
        height: dynamicHeight(0.2),
        child: StreamBuilder<QuerySnapshot>(
          stream: HomeDB.ADVERTS.sliderList,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return buildEmptyCardWidget;
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildEmptyCardWidget;
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              return CarouselSlider(
                items: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return buildBannerCard(context, data);
                }).toList(),
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                ),
              );
            } else {
              return buildEmptyCardWidget;
            }
          },
        ),
      ),
    );
  }

  // banner card
  Widget buildBannerCard(context, data) => GestureDetector(
        onTap: () {
          routerService.sliderControlRouter(context, data);
        },
        child: Card(
          color: Colors.grey.withOpacity(0.2),
          child: SizedBox(
            width: maxWidth,
            child: CachedNetworkImage(
              imageUrl: data['IMG'].toString(),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
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
        ),
      );

  // empty card
  Widget get buildEmptyCardWidget => Card(
        margin: const EdgeInsets.only(left: 20, right: 20),
        color: Colors.grey.withOpacity(0.1),
        child: SizedBox(
          width: maxWidth,
        ),
      );
}
