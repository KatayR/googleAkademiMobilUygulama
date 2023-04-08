import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wvdeneme/home_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebScreen extends StatefulWidget {
  String email;
  String password;
  WebScreen({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<WebScreen> createState() =>
      WebScreenState(email: email, password: password);
}

class WebScreenState extends State<WebScreen> {
  late final WebViewController controller;
  late final WebViewCookieManager cookieManager;
  String email;
  String password;
  WebScreenState({required this.email, required this.password});

  void initState() {
    super.initState();
    cookieManager = WebViewCookieManager();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            if (url == 'https://oyunveuygulamaakademisi.com/egitimler') {
              cookieManager.clearCookies();
              controller.goBack();
            }
          },
          onPageFinished: (String url) async {
            if (url ==
                'https://oyunveuygulamaakademisi.com/giris-yap?next=/egitimler') {
              controller.runJavaScript(
                  "document.getElementById('sign_in_email').value='$email'");
              controller.runJavaScript(
                  "document.getElementById('sign_in_password').value='$password'");
              await Future.delayed(Duration(seconds: 1));
              await controller.runJavaScript(
                  "document.querySelector('div[role='feed']').innerHTML).style.display = 'none'");
              await controller.runJavaScript(
                  "document.querySelector('#form1 > div > div.row.w-100.ms-5.me-5.ps-4.pe-4.mt-4.down-450-pt.down-767-mt1 > div.col-xl-6.col-lg-6.col-md-6.col-12.d-flex.justify-content-end.down-767-d-center.order-xl-1.order-lg-2.order-md-2.order-1.down-767-mb > button').click()");
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            // ********
            if (request.url
                .startsWith('https://oyunveuygulamaakademisi.com/egitimler')) {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setBool('loggedIn', true);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }),
              );
            }
            return NavigationDecision.navigate;
            // *************
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://oyunveuygulamaakademisi.com/giris-yap?next=/egitimler'));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
