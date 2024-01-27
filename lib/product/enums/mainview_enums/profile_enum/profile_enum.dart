enum ProfileStrings {
  appointmentMenuText('Hizmet Randevularınız'),
  accountSettingMenuText('Hesap Ayaları'),
  emailUpdateMenuText('Email Adresi Güncelleme'),
  exitAccountMenuText('Hesaptan Çıkış Yap'),

  nameSurnameUpdateMenuText('Ad Soyad Güncelle'),
  phoneNumberUpdateMenuText('Telefon Numarasını değiştir'),
  cityUpdateMenuText('Şehir bilgisini güncelle'),

  nameSurnameUpdateTitleText('Ad Soyad Güncelle'),
  nameSurnameUpdateSubTitleText('Adınızı ve Soyadınızı güncelleyebilirsiniz.'),

  phoneNumberUpdateTitleText('Telefon Numarası Güncelle'),
  phoneNumberUpdateSubTitleText('Telefon Numaranızı güncelleyebilirsiniz'),

  cityUpdateTitleText('Şehir Bilgisini Güncelle'),
  cityUpdateSubTitleText('Bulunduğunuz şehiri güncelleyebilirsiniz.'),

  emailUpdateNoTitleText('Email Adresi Güncellenemez'),
  emailUpdateNotSubTitleText(
      'Kayıtlı Hesabınıza ait email adresi güncellenemez daha fazla bilgi için kuaförüm ile iletişime geçebilirsiniz.');

  final String value;
  const ProfileStrings(this.value);
}
