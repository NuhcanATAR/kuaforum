import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/enums/mainview_enums/appointment_enum/appointmentcreate_enum/appointmentcreate_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.selectAppointmentDate,
      required this.modelService,
      super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic selectAppointmentDate;
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
                    text:
                        AppointmentCreateStrings.appointmentDateTitleText.value,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // date
              SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.07),
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
                  child: GestureDetector(
                    onTap: () {
                      selectAppointmentDate(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.date_range,
                          color: ColorBackgroundConstant.redDarker,
                          size: 21,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: LabelMediumBlackBoldText(
                              text:
                                  '${modelService.selectedDate.day}.${modelService.selectedDate.month}.${modelService.selectedDate.year} | ${modelService.selectedDate.hour}:${modelService.selectedDate.minute}',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // note
              SizedBox(
                width: maxWidth,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: LabelMediumRedText(
                    text:
                        AppointmentCreateStrings.appointmentDateNoteText.value,
                    textAlign: TextAlign.left,
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
