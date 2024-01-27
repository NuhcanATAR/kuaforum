import 'package:flutter/material.dart';
import 'package:kuaforum/product/enums/mainview_enums/nofication_enum/nofication_enum.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class NoficationCardWidget extends StatelessWidget {
  const NoficationCardWidget({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.appointmentListViewNavigatorRouter(context);
      },
      child: ListTile(
        leading: const Icon(
          Icons.notifications,
          color: Color.fromARGB(255, 189, 170, 0),
          size: 18,
        ),
        title: LabelMediumBlackBoldText(
          text: NoficationStrings.cardTitleText.value,
          textAlign: TextAlign.left,
        ),
        subtitle: LabelMediumBlackText(
          text: NoficationStrings.cardSubTitleText.value,
          textAlign: TextAlign.left,
        ),
        trailing: const Icon(
          Icons.circle,
          size: 15,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}
