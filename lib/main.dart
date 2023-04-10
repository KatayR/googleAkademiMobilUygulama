import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wvdeneme/notesHive.dart';
import 'login_view.dart';
import 'home_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('box');
  Hive.registerAdapter(notesHiveAdapter());
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
      Future.delayed(Duration(seconds: 2));
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
        nextScreen: finalLoginData == null ? GirisEkrani() : HomePage(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }
}
