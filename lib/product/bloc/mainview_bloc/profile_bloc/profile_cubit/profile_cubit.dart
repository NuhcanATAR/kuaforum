import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/profile_bloc/profile_state/profile_state.dart';
import 'package:kuaforum/product/utility/database/main_view_db/profile_db/profile_db.dart';

class MainProfileCubit extends Cubit<MainProfileState> {
  MainProfileCubit() : super(ProfileInitial());

  void nameSurnameUpdate(
      TextEditingController name, TextEditingController surname) async {
    try {
      await ProfileDB.USERS.userRefTable.update({
        "NAME": name.text,
        "SURNAME": surname.text,
      });
      emit(ProfileNameSurnameUpdateSuccess());
    } catch (e) {
      emit(ProfileNameSurnameUpdateError());
    }
  }

  void phoneNumberUpdate(TextEditingController phoneNumber) async {
    try {
      await ProfileDB.USERS.userRefTable.update({
        "PHONENUMBER": phoneNumber.text,
      });
      emit(ProfilePhoneNumberUpdateSuccess());
    } catch (e) {
      emit(ProfilePhoneNumberUpdateError());
    }
  }

  void cityUpdate(String selectCity) async {
    try {
      await ProfileDB.USERS.userRefTable.update({
        "CITY": selectCity,
      });
      emit(ProfileCityUpdateSuccess());
    } catch (e) {
      emit(ProfileCityUpdateError());
    }
  }
}
