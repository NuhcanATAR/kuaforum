import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/utility/database/main_view_db/appointment_db/appointment_db.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AppointmentServiceNameWidget extends StatelessWidget {
  const AppointmentServiceNameWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: maxWidth,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: BodyMediumBlackBoldText(
                    text: "Himzet Adı:",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                width: maxWidth,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
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
        ),
      ),
    );
  }
}
