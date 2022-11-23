import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebView extends StatefulWidget {
  const WebView({Key? key}) : super(key: key);

  @override
  State<WebView> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebView> {
  bool _flag = true;

  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Website"),
          leading: IconButton(
            onPressed: () async {
              if (await _webViewController.canGoBack()) {
                _webViewController.goBack();
              } else {
                Get.back();
              }
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            _flag
                ? loadingWidget()
                : const SizedBox(
              height: 0,
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(Get.arguments),
                ),
                onProgressChanged: (controller, progress) {
                  _webViewController = controller;
                  if (progress / 100 == 1) {
                    setState(() {
                      _flag = false;
                    });
                  }
                },
              ),
            )
          ],
        ));
  }

  Widget loadingWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            // Text(
            //   'Loading...',
            //   style: TextStyle(fontSize: 16.0),
            // ),
            // SizedBox(
            //   width: 10,
            // ),
            CircularProgressIndicator(
              strokeWidth: 2.0,
            )
          ],
        ),
      ),
    );
  }
}
