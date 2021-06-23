import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsModel {
  static const COMMENT = 'Comment';
  static const USERNAME = 'Username';

  String _username;
  String _comment;

  String get username => _username;
  String get comment => _comment;

  CommentsModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _username = data[USERNAME];
    _comment = data[COMMENT];
  }
}
