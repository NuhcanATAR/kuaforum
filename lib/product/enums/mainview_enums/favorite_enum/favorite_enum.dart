enum FavoriteViewStrings {
  errorTitleText('Favori hizmetleriniz Yüklenemedi!'),
  errorSubTitleText(
      'Favori hizmetleriniz yüklenirken bir hata oluştu, daha sonra tekrar deneyiniz!'),

  loadingTitleText('Favori Hizmetler Yükleniyor!'),
  loadingSubTitleText('Lütfen Bekleyiniz...'),

  noTitleText('Favori Hizmetiniz Bulunmamaktadır!'),
  noSubTitleText(
      'Henüz favori hizmet eklemediniz, isterseniz favori hizmet eklemeye başlayabilirsiniz.');

  final String value;
  const FavoriteViewStrings(this.value);
}
