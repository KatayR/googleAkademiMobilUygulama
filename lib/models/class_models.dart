import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

class GoogleColors {
  static var blue = Color.fromRGBO(66, 133, 244, 1);
  static var red = Color.fromRGBO(219, 68, 55, 1);
  static var yellow = Color.fromRGBO(244, 180, 0, 1);
  static var green = Color.fromRGBO(15, 157, 8, 1);
}

abstract class noteColors {
  // /// Dark background color.
  // static const Color backgroundColor = Color(0xFF191D1F);
  //
  // /// Slightly lighter version of [backgroundColor].
  // static const Color backgroundFadedColor = Color(0xFF191B1C);
  //
  // /// Color used for cards and surfaces.
  // static const Color cardColor = Color(0xFF1F2426);
  //
  // /// Accent color used in the application.
  // static const Color accentColor = Color(0xFFef8354);
  static final bg = Color.fromRGBO(253, 243, 176, 1);
}

class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    required Rect begin,
    required Rect end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, elasticCurveValue)!,
      lerpDouble(begin!.top, end!.top, elasticCurveValue)!,
      lerpDouble(begin!.right, end!.right, elasticCurveValue)!,
      lerpDouble(begin!.bottom, end!.bottom, elasticCurveValue)!,
    );
  }
}

class Strings {
  static const homePageTitle = Text(
    "Oyun ve Uygulama Akademisi",
    style: TextStyle(color: Colors.blueGrey),
  );
  static const egitim_title = 'EĞİTİMLER';
  static const premodule_title = "FLUTTER İLE UYGULAMA GELİŞTİRME";
  static const modules_title = "MODÜLLER";
}

class DerslerMap {
  static const modul1 = {
    "Flutter Kurulumu: Flutter SDK": "RKwJwCaaFec",
    "Flutter Kurulumu: PATH Ayarları": "_7f_43nDiSY",
    "Flutter Kurulumu: Android Studio": "905L1sv1nq4",
    "Flutter Kurulumu: Örnek Proje Yaratma": "xxAwKhI-lsM",
  };
  static const modul2 = {
    "Flutter: Örnek Proje": "YOidpKRZf4A",
    "Flutter ve Dart Uygulamaları": "B8Sfz0d8ugA",
    "Değişkenler ve Fonksiyonlar": "7yUGdZppZYk",
    "Fonksiyonlar": "Qpc2p0DEmj4",
  };
  static const modulListOfMaps = [modul1, modul2];
}

class Assets {
  static const homePageImg = 'assets/page-1/images/homepageimg8-1.png';
  static const exitIcon = 'assets/page-1/images/mingcute-exit-fill.png';
  static const homePageBottomImg = 'assets/page-1/images/egitimler.png';
  static const flutter = 'assets/page-1/images/flutter.png';
  static const gazihan = 'assets/page-1/images/gazihan.png';
  static const flutter2_modules = [
    MyCustomText(text: "Modül 1: Flutter kurulumu"),
    MyCustomText(text: "Modül 2: Dart Dilini ve IDE'yi Tanıma"),
    MyCustomText(text: "Modül 3: Dart Dilini Derinlemesine Tanıma"),
    MyCustomText(text: "Modül 4: Dart ile Nesne Tabanlı Programlama"),
    MyCustomText(text: "Modül 5: Collection'lar"),
    MyCustomText(text: "Modül 6: Flutter'a Giriş "),
    MyCustomText(text: "Modül 7: StatefulWidget ve StatelesWidget"),
    MyCustomText(text: "Modül 8: Widget Ağacı"),
    MyCustomText(text: "Modül 9: Layout"),
    MyCustomText(text: "Modül 10: Navigation"),
    MyCustomText(text: "Modül 11: Asenkron Programlama"),
    MyCustomText(text: "Modül 12: Flutter'daki Widget'ları Tanıma 1"),
    MyCustomText(text: "Modül 13: Flutter'daki Widget'ları Tanıma 2"),
    MyCustomText(text: "Modül 14: Basit Bir Uygulama Geliştirelim"),
    MyCustomText(text: "Modül 15: Riverpod ile State Management"),
    MyCustomText(text: "Modül 16: Internet Kullanımı"),
    MyCustomText(text: "Modül 17: Hata Yakalama"),
    MyCustomText(text: "Modül 18: Firebase"),
    MyCustomText(text: "Modül 19: Animasyonlar"),
    MyCustomText(text: "Modül 20: Testler"),
    MyCustomText(text: "Modül 21: Uygulamayı Yayınlamaya Hazırlık"),
  ];
}

class Button extends StatelessWidget {
  final MyCustomText childText;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.childText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 152,
      height: MediaQuery.of(context).size.height * 0.12,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: childText,
      ),
    );
  }
}

class MyCustomText extends StatelessWidget {
  final String text;

  const MyCustomText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w700),
      softWrap: true,
      textAlign: TextAlign.center,
    );
  }
}
