import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/namesurnameupdate_view/widget/nameinput_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/namesurnameupdate_view/widget/surnameinput_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/namesurnameupdate_view/widget/titlesubtitle_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/namesurnameupdate_view/widget/updatebutton_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/profile_bloc/profile_cubit/profile_cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/profile_bloc/profile_state/profile_state.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/profile_enum/profile_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/profile_base/profile_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class NameSurnameUpdateView extends StatefulWidget {
  const NameSurnameUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<NameSurnameUpdateView> createState() => _NameSurnameUpdateViewState();
}

class _NameSurnameUpdateViewState
    extends MainProfileBase<NameSurnameUpdateView> {
  late TextEditingController nameController = TextEditingController(
    text: widget.data['NAME'],
  );
  late TextEditingController surnameController = TextEditingController(
    text: widget.data['SURNAME'],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MainProfileCubit(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: ColorBackgroundConstant.redDarker,
                size: 18,
              ),
            ),
            title: const LabelMediumMainColorText(
              text: "Ad Soyad Güncelle",
              textAlign: TextAlign.center,
            ),
          ),
          body: buildMainBodyWidget,
        ),
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget =>
      BlocConsumer<MainProfileCubit, MainProfileState>(
        listener: profileNameSurnameUpdateListenerBloc,
        builder: (context, state) {
          final profileCubitService =
              BlocProvider.of<MainProfileCubit>(context);
          return Form(
            key: modelService.formUpdateKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // title & sub title
                  buildTitleSubTitleWidget,
                  // name input
                  buildNameInputWidget,
                  // surname input
                  buildSurnameInputWidget,
                  // update button
                  buildUpdateButtonWidget(context, profileCubitService),
                ],
              ),
            ),
          );
        },
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        maxWidth: maxWidth,
        title: ProfileStrings.nameSurnameUpdateTitleText.value,
        subTitle: ProfileStrings.nameSurnameUpdateSubTitleText.value,
      );
  // name input
  Widget get buildNameInputWidget => NameInputWidget(
      modelService: modelService, nameController: nameController);

  // surname input
  Widget get buildSurnameInputWidget => SurnameInputWidget(
        modelService: modelService,
        surnameController: surnameController,
      );

  // update button
  Widget buildUpdateButtonWidget(context, profileCubitService) =>
      UpdateButtonWidget(
        profileCubitService: profileCubitService,
        modelService: modelService,
        nameController: nameController,
        surnameController: surnameController,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
