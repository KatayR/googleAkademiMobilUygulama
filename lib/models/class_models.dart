import 'package:flutter/material.dart';

class Strings {
  static const homePageTitle = Text(
    "Oyun ve Uygulama Akademisi",
    style: TextStyle(color: Colors.blueGrey),
  );
  static const egitim_title = 'EĞİTİMLER';
}

class Assets {
  static const homePageImg = 'assets/page-1/images/homepageimg8-1.png';
  static const exitIcon = 'assets/page-1/images/mingcute-exit-fill.png';
  static const homePageBottomImg = 'assets/page-1/images/about-us-img-3-2.png';
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
