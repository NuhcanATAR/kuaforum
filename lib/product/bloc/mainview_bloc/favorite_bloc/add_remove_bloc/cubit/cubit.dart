import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/favorite_bloc/add_remove_bloc/state/state.dart';
import 'package:kuaforum/product/utility/database/main_view_db/service_db/service_db.dart';
import 'package:kuaforum/product/utility/service/firebase_service.dart';

class FavoriteAddRemoveCubit extends Cubit<FavoriteAddRemoveState> {
  FavoriteAddRemoveCubit() : super(FavoriteAddRemoveInitial());

  void favoriteAdd(Map<String, dynamic> data) async {
    emit(FavoriteAddRemoveLoading());

    try {
      await ServiceDB.FAVORITESERVICES.favoriteService.doc(data['ID']).set({
        "ID": data['ID'],
        "SERVICEID": data['ID'],
        "USERID": FirebaseService().authID,
        "DATE": FieldValue.serverTimestamp(),
        "ACTIVE": true,
      });

      emit(FavoriteAddSuccess());
    } catch (e) {
      emit(FavoriteAddRemoveError('Favori Ekleme işleminde hata oluştu!'));
    }
  }

  void favoriteRemove(Map<String, dynamic> data) async {
    emit(FavoriteAddRemoveLoading());

    try {
      await ServiceDB.FAVORITESERVICES.favoriteService.doc(data['ID']).delete();
      emit(FavoriteRemoveSuccess());
    } catch (e) {
      emit(FavoriteAddRemoveError('Hata oluştu, Tekrar deneyiniz!'));
    }
  }
}
