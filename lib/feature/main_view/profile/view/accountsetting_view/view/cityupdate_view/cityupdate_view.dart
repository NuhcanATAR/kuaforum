import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/cityupdate_view/widget/titlesubtitle_widget.dart';
import 'package:kuaforum/feature/main_view/profile/view/accountsetting_view/view/cityupdate_view/widget/updatebutton_widget.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/profile_bloc/profile_cubit/profile_cubit.dart';
import 'package:kuaforum/product/bloc/mainview_bloc/profile_bloc/profile_state/profile_state.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/profile_enum/profile_enum.dart';
import 'package:kuaforum/product/model/main_view_model/profile_model/profile_model.dart';
import 'package:kuaforum/product/utility/base/main_view_base/profile_base/profile_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class CityUpdateView extends StatefulWidget {
  const CityUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<CityUpdateView> createState() => _CityUpdateViewState();
}

class _CityUpdateViewState extends MainProfileBase<CityUpdateView> {
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
              text: "Şehir Bilgisi Güncelle",
              textAlign: TextAlign.center,
            ),
          ),
          body: buildMainBodyWidget,
        ),
      ),
    );
  }

  Widget get buildMainBodyWidget =>
      BlocConsumer<MainProfileCubit, MainProfileState>(
        listener: (context, state) {
          if (state is ProfileCityUpdateSuccess) {
            final snackBar = SnackBar(
              content: const Text("Şehir Bilginiz Güncellendi"),
              action: SnackBarAction(
                label: "Tamam",
                onPressed: () {},
              ),
              duration: const Duration(
                seconds: 4,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is ProfileCityUpdateError) {
            final snackBar = SnackBar(
              content: const Text("Hata oluştu, Tekrar Deneyiniz!"),
              action: SnackBarAction(
                label: "Tamam",
                onPressed: () {},
              ),
              duration: const Duration(
                seconds: 4,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          final profileCubitService =
              BlocProvider.of<MainProfileCubit>(context);
          return Padding(
            padding: context.padding.low,
            child: ListView(
              children: <Widget>[
                // title & sub title widget
                buildTitleSubTitleWidget,
                // city select
                buildCitySelectWidget,
                // update button
                buildUpdateButtonWidget(context, profileCubitService),
              ],
            ),
          );
        },
      );

  // title & sub title widget
  Widget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        maxWidth: maxWidth,
        title: ProfileStrings.cityUpdateTitleText.value,
        subTitle: ProfileStrings.cityUpdateSubTitleText.value,
      );

  // city select
  Widget get buildCitySelectWidget => Container(
        margin: const EdgeInsets.only(top: 20),
        child: DropdownMenu<String>(
          width: dynamicWidth(0.94),
          initialSelection: modelService.cityValue,
          onSelected: (String? value) {
            setState(() {
              modelService.cityValue = value!;
            });
          },
          textStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          leadingIcon: Icon(
            Icons.location_city,
            color: ColorBackgroundConstant.redDarker,
            size: 18,
          ),
          trailingIcon: Icon(
            Icons.location_on,
            color: ColorBackgroundConstant.redDarker,
            size: 18,
          ),
          dropdownMenuEntries:
              cityList.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry(value: value, label: value);
          }).toList(),
        ),
      );

  // update button
  Widget buildUpdateButtonWidget(context, profileCubitService) =>
      UpdateButtonWidget(
        profileCubitService: profileCubitService,
        cityValue: modelService.cityValue,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
