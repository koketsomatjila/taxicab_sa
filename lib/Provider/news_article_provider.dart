import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:taxicab_sa/Services/news_article_service.dart';
import 'package:taxicab_sa/models/news_article_model.dart';

class NewsArticleProvider with ChangeNotifier {
  List<NewsArticleModel> articles = [];
  ArticlesServices _articlesServices = ArticlesServices();

  NewsArticleProvider.initialize() {
    loadArticles();
  }

  loadArticles() async {
    articles = await _articlesServices.getArticles();
    notifyListeners();
  }

  // Future search({String productName}) async {
  //   productsSearched =
  //       await _productsServices.searchProducts(productName: productName);
  //   notifyListeners();
  // }
}
