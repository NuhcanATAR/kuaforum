import 'package:flutter/material.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/widget/additionalservicelist_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/widget/explanation_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/widget/servicecategory_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/widget/serviceduration_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/widget/serviceimage_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/widget/titlesubtitle_widget.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget(
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
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // image
            buildServiceImgWidget(context, data),
            // service category
            buildServiceCategoryWidget(context, data),
            // service title & sub title
            buildServiceTitleSubTitleWidget(context, data),
            // service explanation
            buildServiceExplanationWidget(context, data),
            // service duration
            buildServiceDurationWidget(context, data),
            // additional service list
            buildAdditionalServiceListWidget(context, data),
          ],
        ),
      ),
    );
  }

  // image
  Widget buildServiceImgWidget(context, Map<String, dynamic> data) =>
      ServiceImageWidget(
        data: data,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // service category
  Widget buildServiceCategoryWidget(context, Map<String, dynamic> data) =>
      ServiceCategoryWidget(
        data: data,
        routerService: routerService,
        maxWidth: maxWidth,
      );

  // service title & sub title
  Widget buildServiceTitleSubTitleWidget(context, Map<String, dynamic> data) =>
      ServiceTitleSubTitleWidget(
        data: data,
        maxWidth: maxWidth,
      );

  // service explanation
  Widget buildServiceExplanationWidget(context, Map<String, dynamic> data) =>
      ExplanationWidget(
        data: data,
        maxWidth: maxWidth,
      );

  // service duration
  Widget buildServiceDurationWidget(context, Map<String, dynamic> data) =>
      ServiceDurationWidget(
        maxWidth: maxWidth,
        data: data,
      );

  // additional service list
  Widget buildAdditionalServiceListWidget(context, Map<String, dynamic> data) =>
      AdditionalServiceListWidget(
        data: data,
      );
}
