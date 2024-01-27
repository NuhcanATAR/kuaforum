import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/utility/database/main_view_db/appointment_db/appointment_db.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class EvaluationInformationWidget extends StatelessWidget {
  const EvaluationInformationWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: AppointmentDB.EVALUATION.evaluationRef.doc(data['ID']).get(),
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
            padding: const EdgeInsets.only(top: 20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: maxWidth,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: BodyMediumBlackBoldText(
                          text: "Değerlendirmeniz:",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // rating
                    SizedBox(
                      width: maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LabelMediumBlackText(
                          text:
                              "Değerlendirme Puanı: ${index['RATING'].toString()}",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // explanation
                    SizedBox(
                      width: maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LabelMediumBlackText(
                          text:
                              "Değerlendirme Açıklaması: ${index['EXPLANATION'].toString()}",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
