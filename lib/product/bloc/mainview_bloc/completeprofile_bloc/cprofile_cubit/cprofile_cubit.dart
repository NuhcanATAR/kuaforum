import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/completeprofile_bloc/cprofile_state/cprofile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/database/main_view_db/bottommenu_db/bottommenu_db.dart';

class AuthUpdProfileCubit extends Cubit<AuthProfileState> {
  AuthUpdProfileCubit() : super(AuthProfileInitial());

  void uploadProfile(String phoneNumber, String city, context) async {
    emit(AuthProfileLoading());

    try {
      await BottomMenuDB.USERS.userRefTable.set(
        {
          "PHONENUMBER": phoneNumber,
          "CITY": city,
        },
        SetOptions(merge: true),
      );

      emit(AuthSuccessProfile());
    } catch (e) {
      emit(AuthProfileError());
    }
  }
}
