import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/favorite/view/favorite_error.dart';
import 'package:kuaforum/feature/main_view/favorite/view/favorite_loading.dart';
import 'package:kuaforum/feature/main_view/favorite/view/favorite_no.dart';
import 'package:kuaforum/feature/main_view/home/view/search_view/widget/servicecard_widget.dart';
import 'package:kuaforum/product/enums/mainview_enums/favorite_enum/favorite_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/favorite_base/favorite_base.dart';
import 'package:kuaforum/product/utility/database/main_view_db/favorite_db/favorite_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends MainFavoriteBase<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumMainColorText(
          text: "Favori Hizmetlerim",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: StreamBuilder<QuerySnapshot>(
          stream: FavoriteDB.FAVORITESERVICES.favoriteListQuery,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return buildFavoriteErrorView;
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildFavoriteLoadingView;
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return FutureBuilder<DocumentSnapshot>(
                    future: FavoriteDB.BASICSERVICES.basicServiceRef(data),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox();
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return const SizedBox();
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> index =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return ServiceCardWidget(
                          data: index,
                          routerService: routerService,
                          maxWidth: maxWidth,
                          dynamicHeight: dynamicHeight,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  );
                }).toList(),
              );
            } else {
              return buildNoFavoriteView;
            }
          },
        ),
      ),
    );
  }

  // favorite error view
  Widget get buildFavoriteErrorView => FavoriteErrorView(
        title: FavoriteViewStrings.errorTitleText.value,
        subTitle: FavoriteViewStrings.errorSubTitleText.value,
      );

  // favorite loading view
  Widget get buildFavoriteLoadingView => FavoriteLoadingView(
        title: FavoriteViewStrings.loadingTitleText.value,
        subTitle: FavoriteViewStrings.loadingSubTitleText.value,
      );

  // no favorite view
  Widget get buildNoFavoriteView => FavoriteNoView(
        title: FavoriteViewStrings.noTitleText.value,
        subTitle: FavoriteViewStrings.noSubTitleText.value,
      );
}
