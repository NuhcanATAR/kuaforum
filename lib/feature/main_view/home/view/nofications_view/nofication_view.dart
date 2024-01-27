import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/home/view/nofications_view/view/noficationerror_view.dart';
import 'package:kuaforum/feature/main_view/home/view/nofications_view/view/noficationloading_view.dart';
import 'package:kuaforum/feature/main_view/home/view/nofications_view/view/noficationno_view.dart';
import 'package:kuaforum/feature/main_view/home/view/nofications_view/widget/noficationcard_widget.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/nofication_enum/nofication_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/home_base/home_base.dart';
import 'package:kuaforum/product/utility/database/main_view_db/home_db/home_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class NoficationView extends StatefulWidget {
  const NoficationView({super.key});

  @override
  State<NoficationView> createState() => _NoficationViewState();
}

class _NoficationViewState extends MainHomeBase<NoficationView> {
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
          text: "Bildirimler",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
          padding: context.padding.low,
          child: StreamBuilder<QuerySnapshot>(
            stream: HomeDB.APPOINTMENTS.appointmentUpdateDateList,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return buildNoficationListErrorView;
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return buildNoficationListLoadingView;
              }

              if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.docs.isNotEmpty) {
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return buildNoficationCardWidget;
                  }).toList(),
                );
              } else {
                return buildNoficationListNoView;
              }
            },
          )),
    );
  }

  // nofication card widget
  Widget get buildNoficationCardWidget => NoficationCardWidget(
        routerService: routerService,
      );

  // nofication list error view
  Widget get buildNoficationListErrorView => NoficationErrorView(
        title: NoficationStrings.listErrorTitleText.value,
        subTitle: NoficationStrings.listErrorSubTitleText.value,
      );

  // nofication list loading view
  Widget get buildNoficationListLoadingView => NoficationLoadingView(
        title: NoficationStrings.listLoadingTitleText.value,
        subTitle: NoficationStrings.listLoadingSubTitleText.value,
      );

  // nofication no view
  Widget get buildNoficationListNoView => NoficationNoView(
        title: NoficationStrings.listNoTitleText.value,
        subTitle: NoficationStrings.listNoSubTitleText.value,
      );
}
