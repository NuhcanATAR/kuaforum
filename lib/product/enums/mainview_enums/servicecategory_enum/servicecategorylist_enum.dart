enum ServiceCategoryListStrings {
  errorTitleText('Kategoriler Yüklenmedi!'),
  errorSubTitleText(
      'Hizmet kategorileri yüklenirken hata oluştu, daha sonra tekrar deneyiniz.'),

  loadingTitleText('Hizmetler Yükleniyor'),
  loadingSubTitleText('Lütfen Bekleyiniz...'),

  noCategoryTitleText('Hizmet Bulunamadı!'),
  noCategorySubTitleText(
      'Henüz hizmet açılmamış, lütfen daha sonra tekrar deneyiniz.');

  final String value;
  const ServiceCategoryListStrings(this.value);
}
