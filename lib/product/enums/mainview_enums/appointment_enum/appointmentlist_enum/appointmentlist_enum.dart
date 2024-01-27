enum AppointmentListStrings {
  errorListTitleText(''),
  errorListSubTitleText(''),

  loadingListTitleText(''),
  loadingListSubTitleText(''),

  noListTitleText(''),
  noListSubTitleText(''),

  rejetTitleText('Randevunuz İptal Edilmiştir'),
  rejectSubTitleText('Oluşturmuş olduğunu randevu iptal edilmiştir.'),

  dateUpdateTitleText('Randevu Tarihi Güncellendi'),
  dateUpdateSubTitleText(
      'Randevu Tarihiniz yönetici tarafından değiştirildi değişikliği onaylıyormusunuz?'),

  confirmationTitleText('Randevunuz Onaylandı'),
  confirmationSubTitleText('Randevunuz yönetici tarafından onaylandı!'),

  completionTitleText('Randevunuz Tamamlandı'),
  completionSubTitleText(
      'Randevunuz tamamlanmıştır, aşağıda bulunan değerlendirme butonu ile aldığınız hizmeti değerlendirebilirsiniz.');

  final String value;
  const AppointmentListStrings(this.value);
}
