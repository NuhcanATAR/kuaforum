import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/utility/database/main_view_db/service_db/service_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ServiceCategoryWidget extends StatelessWidget {
  const ServiceCategoryWidget(
      {required this.data,
      required this.routerService,
      required this.maxWidth,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 5),
        child: FutureBuilder<DocumentSnapshot>(
          future: ServiceDB.SERVICECATEGORY.serviceCategoryRef(data),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const SizedBox();
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const SizedBox();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> index =
                  snapshot.data!.data() as Map<String, dynamic>;
              return GestureDetector(
                onTap: () {
                  routerService.serviceListViewNavigatorRouter(context, index);
                },
                child: LabelMediumBlackText(
                  text: index['CATEGORYNAME'],
                  textAlign: TextAlign.left,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
