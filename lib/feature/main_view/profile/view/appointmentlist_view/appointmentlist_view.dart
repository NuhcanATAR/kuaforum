import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentlisterror_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentlistloading_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentlistno_view.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/widget/appointmentcard_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_cubit/cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_state/state.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/appointment_enum/appointmentlist_enum/appointmentlist_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/appointment_base/appointment_base.dart';
import 'package:kuaforum/product/utility/database/main_view_db/appointment_db/appointment_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentListView extends StatefulWidget {
  const AppointmentListView({super.key});

  @override
  State<AppointmentListView> createState() => _AppointmentListViewState();
}

class _AppointmentListViewState
    extends MainAppointmentBase<AppointmentListView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AppointmentMainCubit(),
        child: Scaffold(
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
              text: "Randevularım",
              textAlign: TextAlign.center,
            ),
          ),
          body: BlocConsumer<AppointmentMainCubit, AppointmentState>(
            listener: appointmentDateUpdateListenerBloc,
            builder: (context, state) {
              final appointmentService =
                  BlocProvider.of<AppointmentMainCubit>(context);
              return Padding(
                padding: context.padding.low,
                child: StreamBuilder<QuerySnapshot>(
                  stream: AppointmentDB.APPOINTMENTS.appointmentListQuery,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return buildAppointmentListErrorView;
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return buildAppointmentListLoadingView;
                    }

                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.docs.isNotEmpty) {
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return buildAppointmentCardWidget(
                              context, data, appointmentService);
                        }).toList(),
                      );
                    } else {
                      return buildAppointmentListNoView;
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // appointment card widget
  Widget buildAppointmentCardWidget(
          context, Map<String, dynamic> data, appointmentService) =>
      AppointmentCardWidget(
        routerMainService: routerMainService,
        data: data,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        appointmentService: appointmentService,
      );

  // appointment list error view
  Widget get buildAppointmentListErrorView => AppointmentListErrorView(
        title: AppointmentListStrings.errorListTitleText.value,
        subTitle: AppointmentListStrings.errorListSubTitleText.value,
      );

  // appointment list loading view
  Widget get buildAppointmentListLoadingView => AppointmentListLoadingView(
        title: AppointmentListStrings.loadingListTitleText.value,
        subTitle: AppointmentListStrings.loadingListSubTitleText.value,
      );

  // appointment list no view
  Widget get buildAppointmentListNoView => AppointmentListNoView(
        title: AppointmentListStrings.noListTitleText.value,
        subTitle: AppointmentListStrings.noListSubTitleText.value,
      );
}
