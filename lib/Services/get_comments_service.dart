import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:taxicab_sa/models/comments_model.dart';
import 'package:uuid/uuid.dart';
// import 'dart:async';

class GetCommentsServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "Comments";

  void publishComment({String username, String comment}) {
    var id = Uuid();
    String commentId = id.v1();

    _firestore
        .collection(collection)
        .doc(commentId)
        .set({'Username': username, 'id': commentId, 'Comment': comment});
  }
}
