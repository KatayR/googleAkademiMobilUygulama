// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'premodules_view.dart';
import '../models/class_models.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentTime;
  @override
  Widget build(BuildContext context) {
    var matrixText1 = const MyCustomText(text: "FLUTTER");
    var matrixText2 = const MyCustomText(text: "UNITY");
    var matrixText3 = const MyCustomText(text: "OYUN SANATI");
    var matrixText4 = const MyCustomText(text: "PROJE YÖNETİMİ");
    var matrixText5 = const MyCustomText(text: "YAZILIMCILAR İÇİN İNGİLİZCE");
    var matrixText6 = const MyCustomText(text: "TEKNOLOJİ GİRİŞİMCİLİĞİ");

    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (currentTime == null ||
            now.difference(currentTime) > const Duration(seconds: 2)) {
          //add duration of press gap
          currentTime = now;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  'Çıkmak için yeniden basın'))); //scaffold message, you can show Toast message too.
          return Future.value(false);
        } else {
          SystemNavigator.pop();
          exit(0);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        Assets.homePageImg,
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.left,
                        "Oyun ve Uygulama Akademisi",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    Strings.egitim_title,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            childText: matrixText1,
                            onPressed: () {
                              // flutter dersleri
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const PreModules();
                              }));
                            },
                          ),
                          Button(
                            childText: matrixText2,
                            onPressed: () {
                              // unity dersleri
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Button(
                                childText: matrixText3,
                                onPressed: () {
                                  // oyun sanatı dersleri
                                }),
                            Button(
                                childText: matrixText4,
                                onPressed: () {
                                  // proje yönetimi dersleri
                                })
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                              childText: matrixText5,
                              onPressed: () {
                                // yazılımcılar için ingilizce dersi
                              }),
                          Button(
                              childText: matrixText6,
                              onPressed: () {
                                // teknoloji girişimciliği dersi
                              })
                        ],
                      ),
                      // Padding(
                      //     padding: const EdgeInsets.symmetric(vertical: 10),
                      //     child: GestureDetector(
                      //       onTap: () {
                      //         // log out bağlantısı
                      //       },
                      //       child: SizedBox(
                      //         height: 38,
                      //         width: 38,
                      //         child: Image.asset(Assets.exitIcon),
                      //       ),
                      //     )),
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    Assets.homePageBottomImg,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
