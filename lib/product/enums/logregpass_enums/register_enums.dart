enum RegisterStrings {
  titleText('Kuaförüme Hoşgeldiniz!'),
  subTitleText(
      'Hesabınızı oluşturun ve hizmetlerimizden yararlanmaya başlayın.'),
  nameText('Adını *'),
  surnameText('Soyadınız *'),
  emailText('E-mail *'),
  passwordText('Şifre *'),
  forgotPasswordText('Şifremi Unuttum'),
  registerBtnText('Kayıt Ol'),
  loginText('Hesabınız saten varmı?'),
  loginBtnText('Giriş Yap'),

  registerSuccessfulTitleText(
      'Hesabınızı doğrulamanız için mail adresinize doğrulama bağlantısı gönderik, doğrulama işleminden sonra hesabınıza giriş yapabilirsiniz.'),

  registerErrorTitleText(
      'Hesabınız oluşturulamadı, lütfen daha sonra tekrar deneyiniz.');

  final String value;
  const RegisterStrings(this.value);
}
