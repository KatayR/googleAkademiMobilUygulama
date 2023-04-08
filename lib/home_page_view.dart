// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wvdeneme/main.dart';

import '../models/class_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var matrixText1 = const MyCustomText(text: "FLUTTER");
    var matrixText2 = const MyCustomText(text: "UNITY");
    var matrixText3 = const MyCustomText(text: "OYUN SANATI");
    var matrixText4 = const MyCustomText(text: "PROJE YÖNETİMİ");
    var matrixText5 = const MyCustomText(text: "YAZILIMCILAR İÇİN İNGİLİZCE");
    var matrixText6 = const MyCustomText(text: "TEKNOLOJİ GİRİŞİMCİLİĞİ");

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    Assets.homePageImg,
                    height: MediaQuery.of(context).size.height * 0.07,
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
                              return MyApp();
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
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GestureDetector(
                          onTap: () {
                            // log out bağlantısı
                          },
                          child: SizedBox(
                            height: 38,
                            width: 38,
                            child: Image.asset(Assets.exitIcon),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: 263,
                  child: Image.asset(Assets.homePageBottomImg))
            ],
          ),
        ),
      ),
    );
  }
}
