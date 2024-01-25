import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_cubit/cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_state/state.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/appointment_enum/appointmentcreate_enum/appointmentcreate_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentFooterWidget extends StatelessWidget {
  const AppointmentFooterWidget(
      {required this.data,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.modelService,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic modelService;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentMainCubit, AppointmentState>(
      listener: (context, state) {
        if (state is AppointmentSavedSuccess) {
          routerService.appointmentLoadingViewNavigatorRouter(
              context, routerService, maxWidth, dynamicHeight);
        } else if (state is AppointmentSavedError) {
          final snackBar = SnackBar(
            content: const Text("Tamam"),
            action: SnackBarAction(
              label: "Tamam",
              onPressed: () {},
            ),
            duration: const Duration(
              seconds: 3,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        final appointmentServiceModel =
            BlocProvider.of<AppointmentMainCubit>(context);
        return SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.1),
          child: Padding(
            padding: context.padding.low,
            child: Row(
              children: <Widget>[
                // service price
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: LabelMediumBlackBoldText(
                      text:
                          "Hizmet Ücreti: ${data['SERVICEPRICE'].toString()}₺",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // appoıntment button
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      appointmentServiceModel.appointmentSaved(
                        data,
                        modelService.selectedDate.day,
                        modelService.selectedDate.month,
                        modelService.selectedDate.year,
                        modelService.selectedDate.hour,
                        modelService.selectedDate.minute,
                        modelService.selectPaymentTypeValue,
                        modelService.appointmentExplanationController,
                      );
                    },
                    child: SizedBox(
                      width: maxWidth,
                      height: dynamicHeight(0.06),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorBackgroundConstant.redDarker,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: LabelMediumWhiteText(
                          text: AppointmentCreateStrings
                              .appointmentCreateBtnText.value,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
