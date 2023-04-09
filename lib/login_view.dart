import 'package:flutter/material.dart';
import 'utils.dart';
import 'webViewFile.dart';
import 'home_page_view.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            // iphone141oUw (0:3)
            padding: EdgeInsets.fromLTRB(0 * fem, 35 * fem, 0 * fem, 30 * fem),
            width: double.infinity,

            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    // oualogo1T3h (1:3)
                    margin: EdgeInsets.fromLTRB(
                        3 * fem, 0 * fem, 0 * fem, 30.83 * fem),
                    width: 327 * fem,
                    height: 174.17 * fem,
                    child: Image.asset(
                      'assets/page-1/images/oualogo-1-3Z5.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    // autogroupgmcfK5u (VrKMz4GRikWP7H1JZ2GMcf)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 40 * fem),
                    padding: EdgeInsets.fromLTRB(
                        63 * fem, 43.52 * fem, 63 * fem, 48.48 * fem),
                    width: 392 * fem,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/page-1/images/bg-new.png',
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // ev7d (12:6)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 18 * fem),
                          padding: EdgeInsets.fromLTRB(
                              28 * fem, 7 * fem, 28 * fem, 14 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(50 * fem),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: (const InputDecoration())
                                .applyDefaults(theme.inputDecorationTheme)
                                .copyWith(hintText: 'E-mail adresi'),
                            keyboardType: TextInputType.emailAddress,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // FSj (12:7)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 11 * fem),
                          padding: EdgeInsets.fromLTRB(
                              27 * fem, 8 * fem, 27 * fem, 12 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(50 * fem),
                          ),
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: (const InputDecoration())
                                .applyDefaults(theme.inputDecorationTheme)
                                .copyWith(hintText: 'Parola'),
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 43,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WebScreen(
                                            email: email, password: password)));
                              },
                              child: Text(
                                'GİRİŞ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 30),
                    child: Image.asset(
                      'assets/page-1/images/n-1.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
