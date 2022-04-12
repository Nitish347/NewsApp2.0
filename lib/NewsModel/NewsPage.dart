import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class NewsPage extends StatefulWidget {
  final String newsUrl;
  NewsPage({this.newsUrl});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "News",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 30),
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.newsUrl,
        ),
      ),
    );
  }
}