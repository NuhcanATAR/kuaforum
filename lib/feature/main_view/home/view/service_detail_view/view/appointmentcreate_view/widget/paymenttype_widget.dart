import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/product/enums/mainview_enums/appointment_enum/appointmentcreate_enum/appointmentcreate_enum.dart';
import 'package:kuaforum/product/model/main_view_model/appointmentcreate_model/appointmentcreate_model.dart';
import 'package:kuaforum/product/utility/base/main_view_base/appointment_base/appointment_base.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class PaymentTypeWidget extends StatefulWidget {
  const PaymentTypeWidget({super.key});

  @override
  State<PaymentTypeWidget> createState() => _PaymentTypeWidgetState();
}

class _PaymentTypeWidgetState extends MainAppointmentBase<PaymentTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                          .servicePaymentTypeTitleText.value,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // date
                SizedBox(
                  width: maxWidth,
                  height: dynamicHeight(0.07),
                  child: DropdownMenu<String>(
                    width: 340,
                    initialSelection: modelService.selectPaymentTypeValue,
                    onSelected: (String? selectValue) {
                      setState(() {
                        modelService.selectPaymentTypeValue = selectValue!;
                      });
                    },
                    textStyle: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dropdownMenuEntries: paymentTypeList
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry(value: value, label: value);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
