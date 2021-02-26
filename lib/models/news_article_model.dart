import 'package:cloud_firestore/cloud_firestore.dart';

class NewsArticleModel {
  static const DATE = 'Date';
  static const TITLE = 'Title';
  static const PICTURE = 'Picture';
  static const ARTICLE = 'Article';

  String _title;
  String _article;
  String _picture;
  String _dateTime;

  String get title => _title;
  String get article => _article;
  String get picture => _picture;
  String get date => _dateTime;

  NewsArticleModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _title = data[TITLE];
    _article = data[ARTICLE];
    _dateTime = data[DATE];
    _picture = data[PICTURE];
  }
}
