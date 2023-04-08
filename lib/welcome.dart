import 'package:flutter/material.dart';
import 'package:wvdeneme/webViewFile.dart';
import 'welcome.dart';

class Wlcm extends StatefulWidget {
  const Wlcm({Key? key}) : super(key: key);

  @override
  State<Wlcm> createState() => _WlcmState();
}

class _WlcmState extends State<Wlcm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
