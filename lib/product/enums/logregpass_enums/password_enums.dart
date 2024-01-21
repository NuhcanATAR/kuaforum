enum PasswordStrings {
  titleText('Şifrenizimi Unuttunuz?'),
  subTitleText(
      'Hesabınıza kayıtlı e-mail adresinizi girerek şifrenizi sıfırlayın.'),

  emailText('E-mail *'),

  resetBtnText('Kontrol Et'),

  passwordSuccessfulTitleText(
      'Şifrenizi sıfırlamanız için e-mail adresinize mail gönderdik gönderilen bağlantıya tıklayarak şifrenizi sıfırlayabilirsiniz.'),

  passwordErrorTitleText('E-mail Adresinizi Kontrol Ediniz.');

  final String value;
  const PasswordStrings(this.value);
}
