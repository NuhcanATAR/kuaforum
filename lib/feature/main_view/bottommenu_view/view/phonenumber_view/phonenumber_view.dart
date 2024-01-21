import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/view/phonenumber_view/widget/nextbtn_wiget.dart';
import 'package:kuaforum/feature/main_view/bottommenu_view/view/phonenumber_view/widget/titlesubtitle_widget.dart';
import 'package:kuaforum/product/utility/base/main_view_base/completeprofile_base/completeprofile_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PhoneNumberView extends StatefulWidget {
  const PhoneNumberView({super.key});

  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends MainCompleteProfileBase<PhoneNumberView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const LabelMediumMainColorText(
          text: "Telefon Numarası",
          textAlign: TextAlign.center,
        ),
      ),
      body: Form(
        key: modelService.formPhoneNumberKey,
        child: Padding(
          padding: context.padding.low,
          child: Column(
            children: <Widget>[
              // main body
              buildMainBodyWidget,
              // next button
              buildNextButtonWidget,
            ],
          ),
        ),
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: ListView(
          children: <Widget>[
            // title & sub title
            buildTitleSubTitleWidget,
            // phone number
            buildPhoneNumberWidget,
          ],
        ),
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        maxWidth: maxWidth,
      );

  // phone number
  Widget get buildPhoneNumberWidget => FadeInLeft(
        child: Container(
          margin: const EdgeInsets.only(top: 15, bottom: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: TextFormField(
            style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: Colors.black,
              ),
            ),
            controller: modelService.phoneNumberController,
            validator: modelService.phoneNumberValidator,
            onChanged: (String? value) {
              setState(() {
                modelService.phoneNumberController.text = value!;
              });
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Telefon Numarası *",
                hintStyle: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                  ),
                )),
          ),
        ),
      );

  // next button
  Widget get buildNextButtonWidget => NextButtonWidget(
        routerService: routerService,
        modelService: modelService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
