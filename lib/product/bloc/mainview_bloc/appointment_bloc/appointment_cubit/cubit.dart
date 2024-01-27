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
        "UPDATESTATUS": false,
        "COMPLETIONSTATUS": false,
        "RATINGSTATUS": false,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });
      emit(AppointmentSavedSuccess());
    } catch (e) {
      emit(AppointmentSavedError());
    }
  }

  void appointmentDateUpdate(Map<String, dynamic> data) async {
    try {
      await AppointmentDB.APPOINTMENTS.appointmentRefTable(data).update({
        "UPDATESTATUS": false,
      });

      emit(AppointmentDateUpdateStatusSuccess());
    } catch (e) {
      emit(AppointmentDateUpdateStatusError());
    }
  }

  void appointmentReject(Map<String, dynamic> data) async {
    try {
      await AppointmentDB.APPOINTMENTS.appointmentRefTable(data).update({
        "REJECTSTATUS": true,
        "UPDATESTATUS": false,
      });

      emit(AppointmentRejectSuccess());
    } catch (e) {
      emit(AppointmentRejectError());
    }
  }

  void evaluationSaved(Map<String, dynamic> data, double rating,
      TextEditingController explanation) async {
    try {
      await AppointmentDB.EVALUATION.evaluationRef.doc(data['ID']).set({
        "ID": data['ID'],
        "APPOINTMENTID": data['ID'],
        "USERID": FirebaseService().authID,
        "BASICSERVICESID": data['BASICSERVICESID'],
        "RATING": rating,
        "EXPLANATION": explanation.text,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) async {
        await AppointmentDB.APPOINTMENTS.appointmentRefTable(data).update({
          "RATINGSTATUS": true,
        });
      });
      emit(EvaluationSavedSuccess());
    } catch (e) {
      emit(EvaluationSavedError());
    }
  }
}
