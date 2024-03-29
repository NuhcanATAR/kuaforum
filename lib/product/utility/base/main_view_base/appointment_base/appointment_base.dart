// ignore_for_file: use_build_context_synchronously

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:kuaforum/feature/main_view/connectionerror_view/connectionerror_view.dart';
import 'package:kuaforum/product/mixin/appointmentbloc_mixin/appointmentbloc_mixin.dart';
import 'package:kuaforum/product/model/main_view_model/appointmentcreate_model/appointmentcreate_model.dart';
import 'package:kuaforum/product/router/main_view_router/appointment_router/appointment_router.dart';
import 'package:kuaforum/product/router/main_view_router/appointmentcreate_router/appointmentcreate_router.dart';
import 'package:logger/logger.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainAppointmentBase<T extends StatefulWidget> extends State<T>
    with AppointmentBlocMixin {
  // model service
  AppointmentCreateModelService modelService = AppointmentCreateModelService();
  // router service
  AppointmentCreateRouterService routerService =
      AppointmentCreateRouterService();
  AppointmentRouterService routerMainService = AppointmentRouterService();
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  // appointment select date
  Future<void> selectAppointmentDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime minTime = DateTime(modelService.selectedDate.year,
        modelService.selectedDate.month, now.day, 9, 0); // Sabah 9:00

    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: minTime,
      maxTime: now.add(const Duration(days: 30)),
      onConfirm: (date) {
        DateTime selectedDateTime = DateTime(
            date.year, date.month, date.day, date.hour, date.minute, 9, 0);

        setState(() {
          modelService.selectedDate = selectedDateTime;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.tr,
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      checkControl();
    });
  }

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      Logger().i("İnternet Bağlandı!!");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ConnectionErrorView(),
        ),
      );
    }
  }
}
