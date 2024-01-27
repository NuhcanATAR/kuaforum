import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/utility/database/main_view_db/appointment_db/appointment_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class EvaluationButtonWidget extends StatelessWidget {
  const EvaluationButtonWidget(
      {required this.data,
      required this.routerMainService,
      required this.appointmentService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerMainService;
  final dynamic appointmentService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: AppointmentDB.APPOINTMENTS.appointmentRef.doc(data['ID']).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const SizedBox();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> index =
              snapshot.data!.data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: index['COMPLETIONSTATUS'] == true
                ? index['RATINGSTATUS'] == true
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          routerMainService.showServiceRatingDialog(
                              context, appointmentService, index);
                        },
                        child: SizedBox(
                          width: maxWidth,
                          height: dynamicHeight(0.07),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorBackgroundConstant.redDarker,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: LabelMediumWhiteText(
                                    text: "Hizmeti Değerlendir",
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                : const SizedBox(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
