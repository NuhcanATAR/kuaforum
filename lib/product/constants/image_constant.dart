import 'package:flutter/material.dart';

enum AppLogoConstant {
  appLogoRed('KUAFORUM'),
  appLogoWhite('KUAFORUM2');

  final String value;
  const AppLogoConstant(this.value);

  String get toPng => "assets/logo/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppSplashSliderImgsConstant {
  appImg1('img1'),
  appImg2('img2'),
  appImg3('img3'),
  appImg4('img4');

  final String value;
  const AppSplashSliderImgsConstant(this.value);

  String get toPng => "assets/images/splash_slider_img/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppLogRegImgsConstant {
  backImg('backimg');

  final String value;
  const AppLogRegImgsConstant(this.value);

  String get toJpg => "assets/images/logreg_img/$value.jpg";
  Image get toImg => Image.asset(toJpg);
}

enum AppErrorImgConstant {
  errorImg('undraw_Location_search_re_ttoj');

  final String value;
  const AppErrorImgConstant(this.value);

  String get toPng => "assets/images/error_img/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum ProfileImgIconConstant {
  userIcon('icons8-user-50'),
  userIconGrey('icons8-user-grey');

  final String value;
  const ProfileImgIconConstant(this.value);

  String get toPng => "assets/icon/profile_icon/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppointmentIcon {
  successIcon('icons8-success-144'),
  successIcon2('success'),
  cancelIcon('cancel'),
  updateIcon('update');

  final String value;
  const AppointmentIcon(this.value);

  String get toPng => "assets/icon/appointment_icon/$value.png";
  Image get toImg => Image.asset(toPng);
}
