class ImageName {
  static final ImageName _singleton = new ImageName._internal();

  factory ImageName() {
    return _singleton;
  }
  static final background = "images/background.png";
  static final clock = "images/clock.png";
  static final light_1 = "images/light_1.png";
  static final light_2 = "images/light_2.png";
  static final google = "images/google.png";
  static final facebook = "images/facebook.png";
  ImageName._internal();
}