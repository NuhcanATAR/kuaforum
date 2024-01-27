import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/utility/database/main_view_db/appointment_db/appointment_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.routerMainService,
      required this.data,
      required this.appointmentService,
      super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final Map<String, dynamic> data;
  final dynamic routerMainService;
  final dynamic appointmentService;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // appoinment date & detail button
            buildAppointmentDateDetailButtonWidget(context, data),
            // status
            buildStatusWidget(context, data),
            // service name
            buildServiceNameWidget(context, data),
            // service price
            buildServicePrice(context, data),
            // appointment detail date update
            buildAppointmentDetailDateUpdateWidget(context, data),
          ],
        ),
      ),
    );
  }

  // appointment date & detail button
  Widget buildAppointmentDateDetailButtonWidget(
          context, Map<String, dynamic> data) =>
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.date_range_outlined,
              color: ColorBackgroundConstant.redDarker,
              size: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: LabelMediumMainColorText(
                  text:
                      "Randevunuz: ${data['DAY']}.${data['MONTH']}.${data['YEAR']} | ${data['HOUR']}:${data['MINUTE']}",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                routerMainService.appointmentDetailViewNavigatorRouter(
                  context,
                  data,
                );
              },
              child: Row(
                children: <Widget>[
                  const LabelMediumMainColorText(
                    text: "Randevu Detayı",
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: ColorBackgroundConstant.redDarker,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // status
  Widget buildStatusWidget(context, Map<String, dynamic> data) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            data['REJECTSTATUS'] == true
                ? Icon(
                    Icons.close,
                    color: ColorBackgroundConstant.redDarker,
                    size: 18,
                  )
                : data['APPOINTMENTSTATUS'] == true
                    ? const Icon(
                        Icons.check,
                        color: Colors.lightGreen,
                        size: 18,
                      )
                    : data['COMPLETIONSTATUS'] == true
                        ? const Icon(
                            Icons.check,
                            color: Colors.lightGreen,
                            size: 18,
                          )
                        : const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 18,
                          ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: data['REJECTSTATUS'] == true
                    ? const LabelMediumBlackBoldText(
                        text: "Randevunuz İptal Edildi",
                        textAlign: TextAlign.left,
                      )
                    : data['APPOINTMENTSTATUS'] == true
                        ? const LabelMediumBlackBoldText(
                            text: "Randevunuz Onaylandı",
                            textAlign: TextAlign.left,
                          )
                        : data['COMPLETIONSTATUS'] == true
                            ? const LabelMediumBlackBoldText(
                                text: "Randevunuz Tamamlandı",
                                textAlign: TextAlign.left,
                              )
                            : data['UPDATESTATUS'] == true
                                ? const LabelMediumMainColorText(
                                    text: "Randevu Tarihi Güncellendi!",
                                    textAlign: TextAlign.left,
                                  )
                                : const LabelMediumBlackText(
                                    text: "Randevunuz Onay Aşamasında",
                                    textAlign: TextAlign.left,
                                  ),
              ),
            ),
          ],
        ),
      );

  // service name
  Widget buildServiceNameWidget(context, Map<String, dynamic> data) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            const LabelMediumGreyText(
              text: "Alınan Hizmet:",
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: FutureBuilder<DocumentSnapshot>(
                  future: AppointmentDB.BASICSERVICES.basicServiceRef(data),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const SizedBox();
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return const SizedBox();
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> userData =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return LabelMediumBlackText(
                        text: userData['SERVICETITLE'],
                        textAlign: TextAlign.left,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );

  // service price
  Widget buildServicePrice(context, Map<String, dynamic> data) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            const LabelMediumGreyText(
              text: "Himzet Ücreti:",
              textAlign: TextAlign.left,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: LabelMediumBlackText(
                  text: "${data['TOTALPRICE']}₺",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      );

  // appointment detail date update
  Widget buildAppointmentDetailDateUpdateWidget(
          context, Map<String, dynamic> data) =>
      data['REJECTSTATUS'] == true
          ? const SizedBox()
          : data['APPOINTMENTSTATUS'] == true
              ? const SizedBox()
              : data['COMPLETIONSTATUS'] == true
                  ? const SizedBox()
                  : data['UPDATESTATUS'] == true
                      ? Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: SizedBox(
                            width: maxWidth,
                            height: dynamicHeight(0.04),
                            child: Row(
                              children: <Widget>[
                                // yes
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        appointmentService
                                            .appointmentDateUpdate(data);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Colors.lightGreen,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                        ),
                                        child: const LabelMediumWhiteText(
                                          text: "Tarihi Onaylıyorum",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // no
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        appointmentService
                                            .appointmentReject(data);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                        ),
                                        child: const LabelMediumWhiteText(
                                          text: "Randevuyu İptal et",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox();
}
