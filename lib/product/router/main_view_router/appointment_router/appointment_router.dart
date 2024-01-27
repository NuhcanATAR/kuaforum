import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/main_view/profile/view/appointmentlist_view/view/appointmentdetail_view/appointmentdetail_view.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';

class AppointmentRouterService {
  // appointment detail view
  void appointmentDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentDetailView(
          data: data,
        ),
      ),
    );
  }

  // service rating
  void showServiceRatingDialog(
    BuildContext context,
    dynamic appointmentService,
    Map<String, dynamic> data,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double serviceRating = 0.0;
        TextEditingController explanationController = TextEditingController();

        return AlertDialog(
          title: const BodyMediumBlackBoldText(
            text: "Hizmet Değerlendirme",
            textAlign: TextAlign.center,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingBar.builder(
                initialRating: serviceRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40.0,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  serviceRating = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextField(
                  controller: explanationController,
                  style: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Açıklama(isteğe bağlı)',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () async {
                appointmentService.evaluationSaved(
                    data, serviceRating, explanationController);
                Navigator.pop(context);
              },
              child: const Text('Değerlendirmeyi Kaydet'),
            ),
          ],
        );
      },
    );
  }
}
