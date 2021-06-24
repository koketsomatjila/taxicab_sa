import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsModel {
  static const COMMENT = 'Comment';
  static const USERNAME = 'Username';
  static const DATE = 'Date';

  String _username;
  String _comment;
  // DateTime _date;
  Timestamp _date;

  String get username => _username;
  String get comment => _comment;
  // DateTime get date => _date;
  Timestamp get date => _date;

  CommentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _username = data[USERNAME];
    _comment = data[COMMENT];
    _date = data[DATE];
  }
}
