enum AppointmentCreateStrings {
  appointmentDateTitleText('Randevu Tarihinizi Belirleyiniz.'),
  appointmentDateNoteText(
      'UYARI!: Seçili randevu tarihiniz kuaförüm tarafından yoğunluk ve özel durumlara göre değiştirilebilir veya iptal edilebilir!'),
  servicePaymentTypeTitleText('Ödeme Yönteminizi seçiniz.'),
  appointmentExplanationTitleText('Randevu için ek açıklama yazabilirsiniz.'),
  appointmentCreateBtnText('Randevuyu Tamamla'),

  appointmentLoadingTitleText('Randevu Oluşturuluyor'),
  appointmentLoadingSubTitleText('Lütfen Bekleyiniz...'),

  successTitleText('Randevunuz Başarıyla Oluşturuldu!'),
  successSubTitleText(
      'Randevunuz alınmıştır, randevunuzu profil sayfanızdan ve ayarlar bölümünden takip edebilirsiniz.'),
  backBtnText('Anasayfaya Dön');

  final String value;
  const AppointmentCreateStrings(this.value);
}
