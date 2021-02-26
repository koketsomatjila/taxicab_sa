import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxicab_sa/models/news_article_model.dart';
// import 'dart:async';

class ArticlesServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "News";

  Future<List<NewsArticleModel>> getArticles() async =>
      _firestore.collection(collection).get().then((result) {
        List<NewsArticleModel> articles = [];
        for (DocumentSnapshot article in result.docs) {
          articles.add(NewsArticleModel.fromSnapshot(article));
        }
        return articles;
      });

  // Future<List<ProductModel>> searchProducts({String productName}) {
  //   String searchKey = productName[0].toUpperCase() + productName.substring(1);
  //   return _firestore
  //       .collection(collection)
  //       .orderBy("name")
  //       .startAt([searchKey])
  //       .endAt([searchKey + '\uf8ff'])
  //       .get()
  //       .then((result) {
  //         List<ProductModel> products = [];
  //         for (DocumentSnapshot product in result.docs) {
  //           products.add(ProductModel.fromSnapshot(product));
  //         }
  //         return products;
  //       });
  // }

}
