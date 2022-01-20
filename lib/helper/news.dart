import 'dart:convert';

import 'package:flutter_news/model/article_modle.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModle> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=2178702bb004400291173cd7ccd6447f";
    var response = await http.get(Uri.parse(url));
    var jsaondata = jsonDecode(response.body);

    if (jsaondata['status'] == "ok") {
      jsaondata["articles"].forEach((element) async {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModle articleModle = ArticleModle(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModle);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModle> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=2178702bb004400291173cd7ccd6447f";
    var response = await http.get(Uri.parse(url));
    var jsaondata = jsonDecode(response.body);

    if (jsaondata['status'] == "ok") {
      jsaondata["articles"].forEach((element) async {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModle articleModle = ArticleModle(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModle);
        }
      });
    }
  }
}
