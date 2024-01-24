import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/view/search_view/widget/servicecard_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicecategorycontrol_view/noservicecategory_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicecategorycontrol_view/servicecategoryerror_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicecategorycontrol_view/servicecategoryloading_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/servicecategory_enum/servicelist_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/servicecategory_base/servicecategory_base.dart';
import 'package:kuaforum/product/utility/database/main_view_db/servicecategory_db/servicecategory_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ServiceListView extends StatefulWidget {
  const ServiceListView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<ServiceListView> createState() => _ServiceListViewState();
}

class _ServiceListViewState extends MainServiceCategoryBase<ServiceListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: LabelMediumMainColorText(
          text: "${widget.data['CATEGORYNAME']} Hizmetleri",
          textAlign: TextAlign.center,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ServiceCategoryDB.BASICSERVICES.serviceList(widget.data),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return buildServiceErrorView;
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildServiceLoadingView;
          }

          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.docs.isNotEmpty) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> index =
                    document.data()! as Map<String, dynamic>;
                return buildServiceCardWidget(context, index);
              }).toList(),
            );
          } else {
            return buildNoServiceView;
          }
        },
      ),
    );
  }

  // service card widget
  Widget buildServiceCardWidget(context, index) => ServiceCardWidget(
        data: index,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // service error view
  Widget get buildServiceErrorView => ServiceCategErrorView(
        title: ServiceListStrings.errorTitleText.value,
        subTitle: ServiceListStrings.errorSubTitleText.value,
      );

  // service loading view
  Widget get buildServiceLoadingView => ServiceCategoryLoadingView(
        title: ServiceListStrings.loadingTitleText.value,
        subTitle: ServiceListStrings.loadingSubTitleText.value,
      );

  // no service view
  Widget get buildNoServiceView => NoServiceCategoryView(
        title: ServiceListStrings.noCategoryTitleText.value,
        subTitle: ServiceListStrings.noCategorySubTitleText.value,
      );
}
