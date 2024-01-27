import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/phonenumberupdate_view/widget/phonenumber_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/phonenumberupdate_view/widget/titlesubtitle_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/phonenumberupdate_view/widget/updatebutton_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/profile_bloc/profile_cubit/profile_cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/profile_bloc/profile_state/profile_state.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/profile_enum/profile_enum.dart';
import 'package:kuaforum/product/utility/base/main_view_base/profile_base/profile_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PhoneNumberUpdateView extends StatefulWidget {
  const PhoneNumberUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<PhoneNumberUpdateView> createState() => _PhoneNumberUpdateViewState();
}

class _PhoneNumberUpdateViewState
    extends MainProfileBase<PhoneNumberUpdateView> {
  late TextEditingController phoneNumberController = TextEditingController(
    text: widget.data['PHONENUMBER'],
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
              text: "Telefon Numarası Güncelle",
              textAlign: TextAlign.center,
            ),
          ),
          body: buildMainBodyWidget,
        ),
      ),
    );
  }

  // main body widget
  Widget get buildMainBodyWidget =>
      BlocConsumer<MainProfileCubit, MainProfileState>(
        listener: profilePhoneNumberUpdateListenerBloc,
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
                  // phone number input
                  buildPhoneNumberInputWidget,
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
        title: ProfileStrings.phoneNumberUpdateTitleText.value,
        subTitle: ProfileStrings.phoneNumberUpdateSubTitleText.value,
      );

  // phone number input
  Widget get buildPhoneNumberInputWidget => PhoneNumberInputWidget(
        modelService: modelService,
        phoneNumberController: phoneNumberController,
      );

  // update button
  Widget buildUpdateButtonWidget(context, profileCubitService) =>
      UpdateButtonWidget(
        profileCubitService: profileCubitService,
        modelService: modelService,
        phoneNumberController: phoneNumberController,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
