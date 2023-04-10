import 'package:flutter/material.dart';
import 'package:wvdeneme/main.dart';
import 'package:wvdeneme/modules_view.dart';
import '../models/class_models.dart';

class PreModules extends StatefulWidget {
  const PreModules({super.key});

  @override
  State<PreModules> createState() => _PreModulesState();
}

class _PreModulesState extends State<PreModules> {
  @override
  Widget build(BuildContext context) {
    var matrixText1 = const MyCustomText(text: "Flutter Hazırlık");
    var matrixText2 =
        const MyCustomText(text: "Flutter ile Uygulama Geliştirme Eğitimleri");
    var matrixText3 =
        const MyCustomText(text: "Flutter ile Örnek Uygulama Geliştirme");

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    Strings.premodule_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        childText: matrixText1,
                        onPressed: () {},
                      ),
                      Button(
                        childText: matrixText2,
                        onPressed: () {
                          // flutter dersleri
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Modules();
                          }));
                        },
                      ),
                      Button(
                        childText: matrixText3,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent.withOpacity(0.4)
                      ],
                    ).createShader(
                        Rect.fromLTRB(0, 50, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    Assets.flutter,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
