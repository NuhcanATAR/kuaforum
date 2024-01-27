enum NoficationStrings {
  cardTitleText('Randevunuzun Tarihi Güncellendi!'),
  cardSubTitleText(
      'Oluşturmuş olduğunuz randevu yönetici tarafından güncellendi, onay vermeniz gerekiyor!!'),

  listErrorTitleText('Bildirimlerde Hata Oluştu!'),
  listErrorSubTitleText(
      'Bildirimler gösterilirken hata oluştu daha sonra tekrar deneyiniz.'),

  listLoadingTitleText('Bildirimler Yükleniyor!'),
  listLoadingSubTitleText('Lütfen Bekleyiniz...'),

  listNoTitleText('Bildiriminiz Yok!'),
  listNoSubTitleText(
      'Henüz Bildirim Almadınız, daha sonra kontrol edebilirsiniz.');

  final String value;
  const NoficationStrings(this.value);
}
