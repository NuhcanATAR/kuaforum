import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kuaforum/product/constants/color_constant.dart';
import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/utility/database/main_view_db/profile_db/profile_db.dart';
import 'package:kuaforum/product/widget/text_widget/body_medium_text.dart';
import 'package:kuaforum/product/widget/text_widget/label_medium_text.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget(
      {required this.maxWidth, required this.dynamicHeight, super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      height: dynamicHeight(0.3),
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 70, bottom: 40),
        color: ColorBackgroundConstant.redDarker,
        child: Row(
          children: <Widget>[
            // profile image
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: ProfileImgIconConstant.userIcon.toImg,
              ),
            ),
            // information user
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: FutureBuilder<DocumentSnapshot>(
                  future: ProfileDB.USERS.userRef,
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const SizedBox();
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return const SizedBox();
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // name surname
                          SizedBox(
                            width: maxWidth,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: BodyMediumWhiteBoldText(
                                text: "${data['NAME']} ${data['SURNAME']}",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          // mail
                          SizedBox(
                            width: maxWidth,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: LabelMediumWhiteText(
                                text: data['EMAIL'],
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
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
    );
  }
}
