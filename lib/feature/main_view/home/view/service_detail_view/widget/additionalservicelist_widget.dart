import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/enums/mainview_enums/service_enum/service_detail_enum.dart';
import 'package:kuaforum/product/utility/database/main_view_db/service_db/service_db.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class AdditionalServiceListWidget extends StatelessWidget {
  const AdditionalServiceListWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: StreamBuilder<QuerySnapshot>(
        stream: ServiceDB.ADDITIONALSERVICES.additionalServiceList(data),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }

          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.docs.isNotEmpty) {
            return Column(
              children: <Widget>[
                // table header
                buildTableHeaderWidget,
                // service list
                buildServiceListWidget(context, snapshot),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  // table header
  Widget get buildTableHeaderWidget => Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    right: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: LabelMediumBlackBoldText(
                  text: ServiceDetailStrings.tableHeaderServiceName.value,
                  textAlign: TextAlign.left,
                )),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    left: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: LabelMediumBlackBoldText(
                  text: ServiceDetailStrings.tableHeaderServicePrice.value,
                  textAlign: TextAlign.left,
                )),
          ),
        ],
      );

  // service list
  Widget buildServiceListWidget(
          context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) =>
      Column(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> index = document.data()! as Map<String, dynamic>;
          return Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                        right: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: LabelMediumBlackText(
                      text: index['SERVICETITLE'],
                      textAlign: TextAlign.left,
                    )),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: LabelMediumBlackText(
                      text: index['SERVICEPRICE'].toString(),
                      textAlign: TextAlign.left,
                    )),
              ),
            ],
          );
        }).toList(),
      );
}
