import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/widget/footer_widget.dart';
import 'package:kuaforum/feature/main_view/home/view/service_detail_view/widget/mainbody_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/favorite_bloc/add_remove_bloc/cubit/cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/favorite_bloc/add_remove_bloc/state/state.dart';

import 'package:kuaforum/product/utility/base/main_view_base/service_base/service_base.dart';
import 'package:kuaforum/product/utility/database/main_view_db/service_db/service_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ServiceDetailView extends StatefulWidget {
  const ServiceDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<ServiceDetailView> createState() => _ServiceDetailViewState();
}

class _ServiceDetailViewState extends MainServiceBase<ServiceDetailView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => FavoriteAddRemoveCubit(),
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 18,
              ),
            ),
            title: const LabelMediumWhiteText(
              text: "Hizmet Detayı",
              textAlign: TextAlign.center,
            ),
            actions: [
              BlocConsumer<FavoriteAddRemoveCubit, FavoriteAddRemoveState>(
                listener: (context, state) {
                  if (state is FavoriteAddSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Favoriye Eklendi"),
                        action: SnackBarAction(
                          label: "Tamam",
                          onPressed: () {},
                        ),
                        duration: const Duration(
                          seconds: 4,
                        ),
                      ),
                    );
                  } else if (state is FavoriteRemoveSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Favoriden Kaldırıldı!"),
                        action: SnackBarAction(
                          label: "Tamam",
                          onPressed: () {},
                        ),
                        duration: const Duration(
                          seconds: 4,
                        ),
                      ),
                    );
                  } else if (state is FavoriteAddRemoveError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Hata oluştu, Tekrar deneyiniz!"),
                        action: SnackBarAction(
                          label: "Tamam",
                          onPressed: () {},
                        ),
                        duration: const Duration(
                          seconds: 4,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final FavoriteAddRemoveCubit favoriteService =
                      BlocProvider.of<FavoriteAddRemoveCubit>(context);
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FutureBuilder<DocumentSnapshot>(
                      future: ServiceDB.FAVORITESERVICES
                          .favoriteServiceRef(widget.data),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const SizedBox();
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return modelService.isFavoriteRemoveStatus != false
                              ? GestureDetector(
                                  onTap: () {
                                    favoriteService.favoriteRemove(widget.data);
                                    setState(() {
                                      modelService.isFavoriteRemoveStatus =
                                          true;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    favoriteService.favoriteAdd(widget.data);
                                    setState(() {
                                      modelService.isFavoriteRemoveStatus =
                                          false;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 21,
                                  ),
                                );
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          return GestureDetector(
                            onTap: () {
                              favoriteService.favoriteRemove(widget.data);
                              setState(() {
                                modelService.isFavoriteAddStatus = false;
                              });
                            },
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 21,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              // main body
              buildMainBodyWidget,
              // footer
              buildFooterWidget,
            ],
          ),
        ),
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget => MainBodyWidget(
        data: widget.data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // footer
  Widget get buildFooterWidget => FooterWidget(
        data: widget.data,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
