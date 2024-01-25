import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/product/enums/mainview_enums/appointment_enum/appointmentcreate_enum/appointmentcreate_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentExplanationWidget extends StatelessWidget {
  const AppointmentExplanationWidget(
      {required this.maxWidth, required this.modelService, super.key});

  final dynamic maxWidth;
  final dynamic modelService;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              // title
              SizedBox(
                width: maxWidth,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: LabelMediumBlackBoldText(
                    text: AppointmentCreateStrings
                        .appointmentExplanationTitleText.value,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // date
              SizedBox(
                width: maxWidth,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: TextFormField(
                    controller: modelService.appointmentExplanationController,
                    maxLines: 4,
                    style: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Açıklama (İsteğe Bağlı)",
                      hintStyle: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.labelMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
