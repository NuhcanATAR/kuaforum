import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';

import 'package:kartal/kartal.dart';
import 'package:kuaforum/feature/login_register_paswor/logreg_view.dart';
import 'package:kuaforum/product/constants/color_constant.dart';

import 'package:kuaforum/product/constants/image_constant.dart';
import 'package:kuaforum/product/constants/string_constant.dart';

class SplashSliderView extends StatefulWidget {
  const SplashSliderView({super.key});

  @override
  State<SplashSliderView> createState() => _SplashSliderViewState();
}

class _SplashSliderViewState extends State<SplashSliderView> {
  List<Slide> slides = [];

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      colorActiveDot: ColorTextConstant.redDarker,
      renderNextBtn: Text(
        'Sonraki',
        style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: ColorTextConstant.redDarker,
        )),
      ),
      renderPrevBtn: Text(
        'Önceki',
        style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: ColorTextConstant.redDarker,
        )),
      ),
      renderSkipBtn: Text(
        'Bitir',
        style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: ColorTextConstant.redDarker,
        )),
      ),
      renderDoneBtn: TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LogRegView(),
            ),
            (Route<dynamic> route) => false,
          );
        },
        child: Text(
          'Başla!',
          style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: ColorTextConstant.redDarker,
          )),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: StringSplashSliderConstant.splashSlider1TitleText,
        description: StringSplashSliderConstant.splashSlider1SubTitleText,
        pathImage: AppSplashSliderImgsConstant.appImg1.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: StringSplashSliderConstant.splashSlider2TitleText,
        description: StringSplashSliderConstant.splashSlider2SubTitleText,
        pathImage: AppSplashSliderImgsConstant.appImg2.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: StringSplashSliderConstant.splashSlider3TitleText,
        description: StringSplashSliderConstant.splashSlider3SubTitleText,
        pathImage: AppSplashSliderImgsConstant.appImg3.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: StringSplashSliderConstant.splashSlider4TitleText,
        description: StringSplashSliderConstant.splashSlider4SubTitleText,
        pathImage: AppSplashSliderImgsConstant.appImg4.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
  }
}
