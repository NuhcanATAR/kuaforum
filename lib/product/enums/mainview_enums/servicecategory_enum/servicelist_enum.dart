enum ServiceListStrings {
  errorTitleText('Hizmetler Yüklenmedi!'),
  errorSubTitleText(
      'Hizmetler yüklenirken hata oluştu, daha sonra tekrar deneyiniz.'),

  loadingTitleText('Hizmetler Yükleniyor'),
  loadingSubTitleText('Lütfen Bekleyiniz...'),

  noCategoryTitleText('Hizmet Bulunamadı!'),
  noCategorySubTitleText(
      'Henüz hizmet açılmamış, lütfen daha sonra tekrar deneyiniz.');

  final String value;
  const ServiceListStrings(this.value);
}
