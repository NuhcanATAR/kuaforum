import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:kuaforum/product/model/main_view_model/appointmentcreate_model/appointmentcreate_model.dart';
import 'package:kuaforum/product/router/main_view_router/appointmentcreate_router/appointmentcreate_router.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainAppointmentBase<T extends StatefulWidget> extends State<T> {
  // model service
  AppointmentCreateModelService modelService = AppointmentCreateModelService();
  // router service
  AppointmentCreateRouterService routerService =
      AppointmentCreateRouterService();
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  Future<void> selectAppointmentDate(BuildContext context) async {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2030, 12, 31),
      onChanged: (date) {
        // onChanged fonksiyonu düzeltilmiş hali
        print('change $date');
      },
      onConfirm: (date) {
        // onConfirm fonksiyonu düzeltilmiş hali
        setState(() {
          modelService.selectedDate = date;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.tr,
    );
  }
}
