enum ConnectionErrorStrings {
  titleText('İnternet Bağlantınız Yok'),
  subTitleText(
      'İnternet bağlantınız yok devam etmek isterseniz kullanımda hatalar alabilirsiniz devam etmek istiyormusunuz?'),
  backButtonText('Devam et');

  final String value;
  const ConnectionErrorStrings(this.value);
}
