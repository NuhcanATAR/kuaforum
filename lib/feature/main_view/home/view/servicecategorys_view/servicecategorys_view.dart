import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicecategorycontrol_view/noservicecategory_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicecategorycontrol_view/servicecategoryerror_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/view/servicecategorycontrol_view/servicecategoryloading_view.dart';
import 'package:kuaforum/feature/main_view/home/view/servicecategorys_view/widget/categorycard_widget.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/servicecategory_enum/servicecategorylist_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/servicecategory_base/servicecategory_base.dart';
import 'package:kuaforum/product/utility/database/main_view_db/servicecategory_db/servicecategory_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ServiceCategorysView extends StatefulWidget {
  const ServiceCategorysView({super.key});

  @override
  State<ServiceCategorysView> createState() => _ServiceCategorysViewState();
}

class _ServiceCategorysViewState
    extends MainServiceCategoryBase<ServiceCategorysView> {
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
        title: const LabelMediumMainColorText(
          text: "Hizmet Kategorileri",
          textAlign: TextAlign.center,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ServiceCategoryDB.SERVICECATEGORY.serviceCategoryList,
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
            return buildServiceCategoryList(context, snapshot);
          } else {
            return buildNoServiceView;
          }
        },
      ),
    );
  }

  // service category list
  Widget buildServiceCategoryList(
          context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) =>
      ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          return CategoryCardWidget(
            routerService: routerService,
            data: data,
          );
        }).toList(),
      );

  // service error view
  Widget get buildServiceErrorView => ServiceCategErrorView(
        title: ServiceCategoryListStrings.errorTitleText.value,
        subTitle: ServiceCategoryListStrings.errorSubTitleText.value,
      );

  // service loading view
  Widget get buildServiceLoadingView => ServiceCategoryLoadingView(
        title: ServiceCategoryListStrings.loadingTitleText.value,
        subTitle: ServiceCategoryListStrings.loadingSubTitleText.value,
      );

  // no service view
  Widget get buildNoServiceView => NoServiceCategoryView(
        title: ServiceCategoryListStrings.noCategoryTitleText.value,
        subTitle: ServiceCategoryListStrings.noCategorySubTitleText.value,
      );
}
