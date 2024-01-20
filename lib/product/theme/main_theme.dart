import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  CustomColorScheme._();

  /// Light color scheme set
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light, // Parlaklık modu: Light
    primary: Color.fromARGB(255, 22, 154,
        123), // Birinci renk (genellikle ana renk): Turkuaz yeşili
    onPrimary:
        Color(0xFFFFFFFF), // Birinci rengin üzerindeki metin rengi: Beyaz
    primaryContainer: Color.fromARGB(255, 224, 92,
        92), // Birinci renge ait konteyner rengi (örneğin: floating action button): Morlu gri
    onPrimaryContainer: Color(
        0xFF21005D), // Birinci renk konteynerinin üzerindeki metin rengi: Lacivert
    secondary: Color(0xFF625B71), // İkinci renk: Gri mor
    onSecondary:
        Color(0xFFFFFFFF), // İkinci rengin üzerindeki metin rengi: Beyaz
    secondaryContainer:
        Color(0xFFE8DEF8), // İkinci renge ait konteyner rengi: Açık morlu pembe
    onSecondaryContainer: Color(
        0xFF1D192B), // İkinci renk konteynerinin üzerindeki metin rengi: Koyu mavi-siyah
    tertiary: Color(0xFF7D5260), // Üçüncü renk: Açık pembe tonları
    onTertiary:
        Color(0xFFFFFFFF), // Üçüncü rengin üzerindeki metin rengi: Beyaz
    tertiaryContainer:
        Color(0xFFFFD8E4), // Üçüncü renge ait konteyner rengi: Pembe tonları
    onTertiaryContainer: Color.fromARGB(255, 197, 16,
        82), // Üçüncü renk konteynerinin üzerindeki metin rengi: Pembemsi kırmızı
    error: Color.fromARGB(255, 225, 28, 100), // Hata rengi: Kırmızı tonları
    onError: Color(0xFFFFFFFF), // Hata renginin üzerindeki metin rengi: Beyaz
    errorContainer:
        Color(0xFFF9DEDC), // Hata rengine ait konteyner rengi: Açık pembe
    onErrorContainer: Color.fromARGB(255, 221, 62,
        54), // Hata renk konteynerinin üzerindeki metin rengi: Koyu kırmızı
    outline: Color(0xFF79747E), // Çerçeve rengi: Gri tonları
    background: Color.fromARGB(
        214, 255, 255, 255), // Arka plan rengi: Pembe-mor tonları
    onBackground: Color.fromARGB(
        255, 11, 11, 14), // Arka plan renginin üzerindeki metin rengi: Siyah
    surface: Color.fromARGB(
        255, 224, 92, 92), // Yüzey rengi (örneğin: app bar): Koyu mavi tonları
    onSurface:
        Color(0xFF1C1B1F), // Yüzey renginin üzerindeki metin rengi: Siyah
    surfaceVariant:
        Color(0xFFE7E0EC), // Yüzeyin varyant rengi: Açık mor tonları
    onSurfaceVariant: Color(
        0xFF49454F), // Yüzeyin varyant renginin üzerindeki metin rengi: Gri tonları
    inverseSurface: Color(0xFF313033), // Ters yüzey rengi: Gri-siyah tonları
    onInverseSurface: Color(
        0xFFF4EFF4), // Ters yüzey renginin üzerindeki metin rengi: Beyaz tonları
    inversePrimary:
        Color.fromARGB(255, 175, 46, 17), // Ters birinci renk: Açık mavi
    shadow:
        Color.fromARGB(255, 137, 11, 11), // Gölgelendirme rengi: Koyu kırmızı
    surfaceTint: Color(0xFF6750A4), // Yüzey tonu: Mor tonları
    outlineVariant: Color(0xFFCAC4D0), // Çerçeve varyant rengi: Gri tonları
    scrim: Color.fromARGB(255, 191, 21, 21), // Perde rengi: Siyah
  );
}
