enum AppointmentListStrings {
  errorListTitleText('Randevularınız Listelenemedi!'),
  errorListSubTitleText(
      'Randevularınız yüklenirken hata oluştu, daha sonra tekrar deneyiniz!'),

  loadingListTitleText('Randevularınız Yükleniyor'),
  loadingListSubTitleText('Lütfen Bekleyiniz...'),

  noListTitleText('Henüz Randevu Oluşturmadınız'),
  noListSubTitleText(
      'Henüz Randevu Oluşturmadınız, isterseniz randevu oluşturmaya başlayabilirsiniz.'),

  rejetTitleText('Randevunuz İptal Edilmiştir'),
  rejectSubTitleText('Oluşturmuş olduğunu randevu iptal edilmiştir.'),

  dateUpdateTitleText('Randevu Tarihi Güncellendi'),
  dateUpdateSubTitleText('Randevu Tarihiniz yönetici tarafından değiştirildi.'),

  confirmationTitleText('Randevunuz Onaylandı'),
  confirmationSubTitleText('Randevunuz yönetici tarafından onaylandı!'),

  completionTitleText('Randevunuz Tamamlandı'),
  completionSubTitleText(
      'Randevunuz tamamlanmıştır, aşağıda bulunan değerlendirme butonu ile aldığınız hizmeti değerlendirebilirsiniz.');

  final String value;
  const AppointmentListStrings(this.value);
}
