import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxicab_sa/models/comments_model.dart';
// import 'dart:async';

class CommentsServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "Comments";

  Future<List<CommentsModel>> getComments() async => _firestore
          .collection(collection)
          .orderBy('Date', descending: false)
          .get()
          .then((result) {
        List<CommentsModel> comments = [];
        for (DocumentSnapshot comment in result.docs) {
          comments.add(CommentsModel.fromSnapshot(comment));
        }
        return comments;
      });
}
