import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/view/appointmentcreate_view/widget/explanation_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/view/appointmentcreate_view/widget/footet_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/view/appointmentcreate_view/widget/paymenttype_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/view/appointmentcreate_view/widget/selectdate_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_cubit/cubit.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/utility/base/main_view_base/appointment_base/appointment_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentCreateView extends StatefulWidget {
  const AppointmentCreateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<AppointmentCreateView> createState() => _AppointmentCreateViewState();
}

class _AppointmentCreateViewState
    extends MainAppointmentBase<AppointmentCreateView> {
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
              text: "Randevu Oluştur",
              textAlign: TextAlign.center,
            ),
          ),
          body: Padding(
            padding: context.padding.low,
            child: Column(
              children: <Widget>[
                // main body
                buildMainBodyWidget,
                // footer
                buildFooterWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: ListView(
          children: <Widget>[
            // appointment select date
            buildAppointmentSelectDateWidget,
            // payment type
            buildAppointmentPaymentTypeWidget,
            // appointment explanation
            buildAppointmentExplanationWidget,
          ],
        ),
      );

  // appointment select date
  Widget get buildAppointmentSelectDateWidget => SelectDateWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        selectAppointmentDate: selectAppointmentDate,
        modelService: modelService,
      );

  // payment type
  Widget get buildAppointmentPaymentTypeWidget => const PaymentTypeWidget();

  // appointment explanation
  Widget get buildAppointmentExplanationWidget => AppointmentExplanationWidget(
        maxWidth: maxWidth,
        modelService: modelService,
      );

  // footer
  Widget get buildFooterWidget => AppointmentFooterWidget(
        data: widget.data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        modelService: modelService,
      );
}
