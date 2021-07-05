import 'package:cloud_firestore/cloud_firestore.dart';

class NewsArticleModel {
  static const DATE = 'Date';
  static const TITLE = 'Title';
  static const PICTURE = 'Picture';
  static const ARTICLE = 'Article';
  static const LINK = 'Link';

  String _title;
  String _article;
  String _picture;
  Timestamp _dateTime;
  String _link;

  String get title => _title;
  String get article => _article;
  String get picture => _picture;
  Timestamp get date => _dateTime;
  String get link => _link;

  NewsArticleModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _title = data[TITLE];
    _article = data[ARTICLE];
    _dateTime = data[DATE];
    _picture = data[PICTURE];
    _link = data[LINK];
  }
}
