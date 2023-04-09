import 'package:flutter/material.dart';
import 'package:wvdeneme/main.dart';
import '../models/class_models.dart';

class Modules extends StatefulWidget {
  const Modules({super.key});

  @override
  State<Modules> createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  @override
  Widget build(BuildContext context) {
    var matrixText1 = const MyCustomText(text: "Modül: 1 Flutter Kurulumu");
    var matrixText2 =
        const MyCustomText(text: "Modül: Dart Dilini ve IDE'yi tanıma");
    var matrixText3 = const MyCustomText(text: "Modül:1 Flutter kurulumu");
    var matrixText4 =
        const MyCustomText(text: "Modül 2: Dart Dilini ve IDE'yi Tanıma");
    var matrixText5 =
        const MyCustomText(text: "Modül 3: Dart Dilini Derinlemesine Tanıma");
    var matrixText6 =
        const MyCustomText(text: "Modül 4: Dart ile Nesne Tabanlı Programlama");

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            //2
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  title: Text(
                    'Flutter ile Uygulama Geliştirme Eğitimleri',
                    textScaleFactor: 1,
                    style: TextStyle(color: Colors.black, shadows: [
                      Shadow(
                          // bottomRight
                          offset: Offset(1.0, 1.0),
                          color: Colors.grey),
                    ]),
                  ),
                  background: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent.withOpacity(0.8)
                        ],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      Assets.gazihan,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                  // Image.asset(
                  //   'assets/page-1/images/gazihan.png',
                  //   alignment: FractionalOffset(0.67, 0.67),
                  //   fit: BoxFit.fitWidth,
                  // ),
                  ),
            ),
            //3
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 1.7),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    padding: index.isEven
                        ? EdgeInsets.only(left: 25)
                        : EdgeInsets.only(right: 25),
                    alignment: Alignment.center,
                    child: Flexible(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Button(
                          childText: Assets.flutter2_modules[index],
                          onPressed: () {
                            // flutter dersleri
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MyApp();
                            }));
                          },
                        ),
                      ),
                    ),
                  );
                },
                childCount: Assets.flutter2_modules.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
