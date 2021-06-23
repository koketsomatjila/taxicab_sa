import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxicab_sa/Services/comments_service.dart';
import 'package:taxicab_sa/models/comments_model.dart';

class CommentsProvider with ChangeNotifier {
  List<CommentsModel> comments = [];
  CommentsServices _commentsServices = CommentsServices();

  CommentsProvider.initialize() {
    loadComments();
  }

  loadComments() async {
    comments = await _commentsServices.getComments();
    notifyListeners();
  }
}
