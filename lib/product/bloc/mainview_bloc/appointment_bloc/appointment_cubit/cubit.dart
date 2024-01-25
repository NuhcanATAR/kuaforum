import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/appointment_bloc/appointment_state/state.dart';
import 'package:kuaforum/product/utility/database/main_view_db/appointment_db/appointment_db.dart';
import 'package:kuaforum/product/utility/service/firebase_service.dart';

class AppointmentMainCubit extends Cubit<AppointmentState> {
  AppointmentMainCubit() : super(AppointmentInitial());

  void appointmentSaved(
      Map<String, dynamic> data,
      int selectDay,
      int selectMonth,
      int selectYear,
      int selectHour,
      int selectMinute,
      String selectPaymentType,
      TextEditingController explanation) async {
    try {
      await AppointmentDB.APPOINTMENTS.appointmentRef.add({
        "ID": null,
        "USERID": FirebaseService().authID,
        "BASICSERVICESID": data['ID'],
        "DAY": selectDay,
        "MONTH": selectMonth,
        "YEAR": selectYear,
        "HOUR": selectHour,
        "MINUTE": selectMinute,
        "PAYMENTTYPE": selectPaymentType,
        "TOTALPRICE": data['SERVICEPRICE'],
        "EXPLANATION": explanation.text,
        "APPOINTMENTSTATUS": false,
        "REJECTSTATUS": false,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });
      emit(AppointmentSavedSuccess());
    } catch (e) {
      emit(AppointmentSavedError('Hata oluştu, Tekrar Deneyiniz!'));
    }
  }
}
