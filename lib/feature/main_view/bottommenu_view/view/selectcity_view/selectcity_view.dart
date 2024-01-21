import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/view/selectcity_view/widget/savebtn_widget.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/view/selectcity_view/widget/titlesubtitle_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/completeprofile_bloc/cprofile_cubit/cprofile_cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/completeprofile_bloc/cprofile_state/cprofile_state.dart';
import 'package:kuaforum/product/model/main_view_model/profilecomplete_model/profilecomplete_model.dart';
import 'package:kuaforum/product/utility/base/main_view_base/completeprofile_base/completeprofile_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class SelectCityView extends StatefulWidget {
  const SelectCityView({required this.phoneNumberValue, super.key});

  final String phoneNumberValue;

  @override
  State<SelectCityView> createState() => _SelectCityViewState();
}

class _SelectCityViewState extends MainCompleteProfileBase<SelectCityView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthUpdProfileCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const LabelMediumMainColorText(
            text: "Şehir Seçimi",
            textAlign: TextAlign.center,
          ),
        ),
        body: buildBlocMainBodyWiget,
      ),
    );
  }

  // bloc main body
  Widget get buildBlocMainBodyWiget =>
      BlocConsumer<AuthUpdProfileCubit, AuthProfileState>(
        listener: (context, state) {
          if (state is AuthSuccessProfile) {
            routerService.loginLoadingViewNavigatorRouter(context);
          } else if (state is AuthProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    const Text("Hata Oluştu, Daha Sonra Tekrar Deneyiniz."),
                action: SnackBarAction(
                  label: "Tamam",
                  onPressed: () {},
                ),
                duration: const Duration(seconds: 4),
              ),
            );
          }
        },
        builder: (context, state) {
          final AuthUpdProfileCubit productCubit =
              BlocProvider.of<AuthUpdProfileCubit>(context);
          return Form(
            key: modelService.formSelectCityKey,
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // main body
                  buildMainBodyWidget,
                  // save button
                  buildSavedButtonWidget(
                      context, productCubit, widget.phoneNumberValue),
                ],
              ),
            ),
          );
        },
      );

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: ListView(
          children: <Widget>[
            // title & sub title
            buildTitleSubTitleWidget,
            // select city
            buildSelectCityWidget,
          ],
        ),
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        maxWidth: maxWidth,
      );

  // select city
  Widget get buildSelectCityWidget => FadeInLeft(
        child: Container(
          margin: const EdgeInsets.only(top: 15, bottom: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: modelService.selectCity,
            icon: const Icon(
              Icons.location_on,
              size: 18,
            ),
            elevation: 16,
            style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: Colors.black,
              ),
            ),
            underline: Container(
              height: 1,
              color: Colors.transparent,
            ),
            onChanged: (String? value) {
              setState(() {
                modelService.selectCity = value!;
              });
            },
            items: cityList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: LabelMediumBlackBoldText(
                  text: value,
                  textAlign: TextAlign.left,
                ),
              );
            }).toList(),
          ),
        ),
      );

  // save button
  Widget buildSavedButtonWidget(context, productCubit, phoneNumberValue) =>
      SavedButtonWiget(
        routerService: routerService,
        modelService: modelService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        productCubit: productCubit,
        phoneNumber: phoneNumberValue,
      );
}
