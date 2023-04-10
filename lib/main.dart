import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wvdeneme/modules_view.dart';
import 'package:wvdeneme/video_screen_view.dart';
import 'login_view.dart';
import 'home_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'premodules_view.dart';
import 'package:wvdeneme/models/notePreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

bool? finalLoginData;

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getLoginData().whenComplete(() async {
      print('get navi öncesi');
      Future.delayed(Duration(seconds: 2));
      print('get navi sonraası');
    });
    super.initState();
  }

  Future getLoginData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var obtainedLoginData = sharedPreferences.getBool('loggedIn');
    setState(() {
      finalLoginData = obtainedLoginData;
    });
    print(finalLoginData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 2000,
        splash: 'assets/splash.jpg',
        nextScreen: Modules(),
        // finalLoginData == null ? GirisEkrani() : HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}
