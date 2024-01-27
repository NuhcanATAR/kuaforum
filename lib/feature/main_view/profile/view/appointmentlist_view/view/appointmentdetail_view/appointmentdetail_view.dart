import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/appointmentconfirmation_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/appointmentdate_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/appointmentdateupdate_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/appointmentpaymentinformation_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/appointmentrejectstatus_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/appointmentserviceexplanation_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/appointmentservicename_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/completionstatus_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/evaluationbutton_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/widget/evaluationinformation_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_cubit/cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_state/state.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/appointment_enum/appointmentlist_enum/appointmentlist_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/appointment_base/appointment_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentDetailView extends StatefulWidget {
  const AppointmentDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<AppointmentDetailView> createState() => _AppointmentDetailViewState();
}

class _AppointmentDetailViewState
    extends MainAppointmentBase<AppointmentDetailView> {
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
              text: "Randevu Detayı",
              textAlign: TextAlign.center,
            ),
          ),
          body: BlocConsumer<AppointmentMainCubit, AppointmentState>(
            listener: (context, state) {
              if (state is EvaluationSavedSuccess) {
                final snackBar = SnackBar(
                  content: const Text("Değerlendirme alındı"),
                  action: SnackBarAction(
                    label: "Tamam",
                    onPressed: () {},
                  ),
                  duration: const Duration(
                    seconds: 4,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (state is EvaluationSavedError) {
                final snackBar = SnackBar(
                  content: const Text("Hata oluştu"),
                  action: SnackBarAction(
                    label: "Tamam",
                    onPressed: () {},
                  ),
                  duration: const Duration(
                    seconds: 4,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              final appointmentService =
                  BlocProvider.of<AppointmentMainCubit>(context);
              return Padding(
                padding: context.padding.low,
                child: ListView(
                  children: <Widget>[
                    // appointment reject status
                    buildAppointmentRejectStatusWidget(context, widget.data),
                    // date update
                    buildDateUpdateWidget(context, widget.data),
                    // appointment confirmation
                    buildAppointmentConfirmationWidget(context, widget.data),
                    // completion status
                    buildCompletionStatusWidget(context, widget.data),
                    // appointment date widget
                    buildAppointmentDateWidget(context, widget.data),
                    // service name card
                    buildServiceNameCardWidget(context, widget.data),
                    // appointment explanation
                    buildAppointmentExplanationWidget(context, widget.data),
                    // payment information
                    buildPaymentInformationWidget(context, widget.data),
                    // evaluation button widget
                    buildEvaluationButtonWidget(
                        context, widget.data, appointmentService),
                    // evaluation information
                    buildEvaluationInformationWidget(context, widget.data)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // appointment reject status
  Widget buildAppointmentRejectStatusWidget(
          context, Map<String, dynamic> data) =>
      AppointmentRejectStatusWidget(
        data: data,
        title: AppointmentListStrings.rejetTitleText.value,
        subTitle: AppointmentListStrings.rejectSubTitleText.value,
      );

  // date update
  Widget buildDateUpdateWidget(context, Map<String, dynamic> data) =>
      AppointmentDateUpdateStatusWidget(
        data: data,
        title: AppointmentListStrings.dateUpdateTitleText.value,
        subTitle: AppointmentListStrings.dateUpdateSubTitleText.value,
      );

  // appointment confirmation
  Widget buildAppointmentConfirmationWidget(
          context, Map<String, dynamic> data) =>
      AppointmentConfirmationWidget(
        data: data,
        title: AppointmentListStrings.confirmationTitleText.value,
        subTitle: AppointmentListStrings.confirmationSubTitleText.value,
      );

  // completion status
  Widget buildCompletionStatusWidget(context, Map<String, dynamic> data) =>
      AppointmentCompletionStatusWidget(
        data: data,
        title: AppointmentListStrings.completionTitleText.value,
        subTitle: AppointmentListStrings.completionSubTitleText.value,
      );

  // appointment date widget
  Widget buildAppointmentDateWidget(context, Map<String, dynamic> data) =>
      AppointmentDateWidget(
        data: data,
      );

  // service name
  Widget buildServiceNameCardWidget(context, Map<String, dynamic> data) =>
      AppointmentServiceNameWidget(
        data: data,
        maxWidth: maxWidth,
      );

  // appointment explanation
  Widget buildAppointmentExplanationWidget(
          context, Map<String, dynamic> data) =>
      AppointmentServiceExplanationWidget(
        data: data,
        maxWidth: maxWidth,
      );

  // payment information
  Widget buildPaymentInformationWidget(context, Map<String, dynamic> data) =>
      AppointmentPaymentInformationWidget(
        data: data,
      );

  // evaluation button widget
  Widget buildEvaluationButtonWidget(
          context, Map<String, dynamic> data, appointmentService) =>
      EvaluationButtonWidget(
        data: data,
        routerMainService: routerMainService,
        appointmentService: appointmentService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // evaluation information
  Widget buildEvaluationInformationWidget(context, Map<String, dynamic> data) =>
      EvaluationInformationWidget(
        data: data,
        maxWidth: maxWidth,
      );
}
