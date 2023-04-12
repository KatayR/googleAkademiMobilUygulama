import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wvdeneme/home_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';

class WebScreen extends StatefulWidget {
  String email;
  String password;
  WebScreen({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<WebScreen> createState() =>
      WebScreenState(email: email, password: password);
}

class WebScreenState extends State<WebScreen> with TickerProviderStateMixin {
  late AnimationController animcontroller;
  late final WebViewController controller;
  late final WebViewCookieManager cookieManager;
  String email;
  String password;
  WebScreenState({required this.email, required this.password});

  static String loginError = "";
  @override
  void initState() {
    super.initState();
    cookieManager = WebViewCookieManager();
    controller = WebViewController()
      ..addJavaScriptChannel("Print",
          onMessageReceived: (JavaScriptMessage message) {
        loginError = message.message;
        print(loginError);
        if (loginError != "") {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Hata',
              text: loginError,
              confirmBtnText: "Pekala",
              onConfirmBtnTap: () {
                while (Navigator.canPop(context)) {
                  // Navigator.canPop return true if can pop
                  Navigator.pop(context);
                }
              });
        }
      })
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            // if (url == 'https://oyunveuygulamaakademisi.com/egitimler') {
            //   cookieManager.clearCookies();
            //   controller.goBack();
            //   controller.reload();
            // }
          },
          onPageFinished: (String url) async {
            if (url ==
                'https://oyunveuygulamaakademisi.com/giris-yap?next=/egitimler') {
              await controller.runJavaScriptReturningResult(r"""
              
              
              $('.btn.pink_button').click(function(event) {
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: '/',
      data: $('#login-form').serialize(),
      success: function(response) {
        if ($('#toast-container > div > div.toast-message').length) {
          var toastMessage = $('#toast-container > div > div.toast-message').text().trim();
  
          if (toastMessage != null) {
            window.Print.postMessage(toastMessage);
          } else {
            alert("helal");
          }
        } else {
          postMessage("helal degil");
        }
      },
      error: function() {
        postMessage("hic helal degillogin error");
      }
    });
  });
              
              
              """);
              controller.runJavaScript(
                  "document.getElementById('sign_in_email').value='$email'");
              await Future.delayed(const Duration(milliseconds: 250));
              controller.runJavaScript(
                  "document.getElementById('sign_in_password').value='$password'");
              await Future.delayed(const Duration(milliseconds: 250));
              await controller.runJavaScript(
                  'document.querySelector("body > div.cc-window.cc-floating.cc-type-opt-out.cc-theme-classic.cc-bottom.cc-color-override--1762072787").style.display = "none";');
              await Future.delayed(const Duration(milliseconds: 250));
              await controller.runJavaScript(
                  "document.querySelector('#form1 > div > div.row.w-100.ms-5.me-5.ps-4.pe-4.mt-4.down-450-pt.down-767-mt1 > div.col-xl-6.col-lg-6.col-md-6.col-12.d-flex.justify-content-end.down-767-d-center.order-xl-1.order-lg-2.order-md-2.order-1.down-767-mb > button').click()");
              await Future.delayed(const Duration(milliseconds: 50));
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            print("deneme yapılıyor");
            // ********
            if (request.url
                .startsWith('https://oyunveuygulamaakademisi.com/egitimler')) {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setBool('loggedIn', true);
              cookieManager.clearCookies();
              controller.goBack();
              controller.reload();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }),
              );
            }
            cookieManager.clearCookies();
            controller.goBack();
            controller.reload();
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
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          WebViewWidget(controller: controller),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }
}
