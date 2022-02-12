// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/model/article_modle.dart';
import 'package:flutter_news/views/home_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticleModle> articles = <ArticleModle>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

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
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.only(top: 16),
                            shrinkWrap: true,
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                  imageUrl: articles[index].urlToImage,
                                  title: articles[index].title,
                                  desc: articles[index].description,
                                  url: articles[index].url);
                            }),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
