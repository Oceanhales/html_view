import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: WebViewLoad()
        )
    );
  }
}

class WebViewLoad extends StatefulWidget {


  WebViewLoadUI createState() => WebViewLoadUI();

}

class WebViewLoadUI extends State<WebViewLoad>{

  InAppWebViewController webView;
  WebViewController webViewController;
  String htmlFilePath = 'assets/TestPage.html';

  loadLocalHTML() async{

    String fileHtmlContents = await rootBundle.loadString(htmlFilePath);
    webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('')),
      body:InAppWebView(
        //initialUrl: "https://flutter.dev/",
        initialHeaders: {},
        initialFile: 'assets/Fivesalah.html',
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              debuggingEnabled: true,
            )
        ),

        onWebViewCreated: (InAppWebViewController controller) {
          webView = controller;
          //loadLocalHTML();
        },
        // onLoadStart: (InAppWebViewController controller, String url) {
        //   setState(() {
        //     this.url = url;
        //   });
        // },
        // onLoadStop: (InAppWebViewController controller, String url) async {
        //   setState(() {
        //     this.url = url;
        //   });
        // },
        // onProgressChanged: (InAppWebViewController controller, int progress) {
        //   setState(() {
        //     this.progress = progress / 100;
        //   });
        // },
      ),


    );
  }
}