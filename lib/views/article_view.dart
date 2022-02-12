// ignore_for_file: avoid_unnecessary_containers, unused_field, sized_box_for_whitespace

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "My",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          actions: [
            Opacity(
              opacity: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.save),
              ),
            )
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            initialUrl: widget.imageUrl,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
          ),
        ));
  }
}
