class Assets {
  static String _generate(String imageName, {String? ext = ".png"}) {
    return 'assets/images/$imageName$ext';
  }

  static String get pinClodwalk => _generate("pin_cloudwalk");
}
