import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taxicab_sa/Common/comment_tile.dart';
import 'package:taxicab_sa/Provider/comments_provider.dart';
import 'package:taxicab_sa/Services/get_comments_service.dart';
import 'package:taxicab_sa/models/comments_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Comments extends StatefulWidget {
  Comments({Key key, this.comment}) : super(key: key);

  final CommentsModel comment;

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  var stream;

  final formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();
  // final TextEditingController _textEditingController3 = TextEditingController();

  GetCommentsServices getCommentsServices = GetCommentsServices();
  final snackBar = SnackBar(content: Text('Comment Added'));

  Future<void> commentDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        // initialValue: '',
                        controller: _textEditingController,
                        validator: (value) {
                          return value.isNotEmpty ? null : "Invalid Username";
                        },
                        decoration: InputDecoration(hintText: "Enter Username"),
                      ),
                      // TextFormField(
                      //   // initialValue: '',
                      //   controller: _textEditingController3,
                      //   keyboardType: TextInputType.emailAddress,
                      //   // ignore: missing_return
                      //   validator: (value) {
                      //     if (value.isEmpty) {
                      //       Pattern pattern =
                      //           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      //       RegExp regex = new RegExp(pattern);
                      //       if (!regex.hasMatch(value)) return "Invalid Email";

                      //       return null;
                      //     }
                      //   },

                      //   decoration: InputDecoration(hintText: "Enter email"),
                      // ),
                      TextFormField(
                        // initialValue: '',
                        controller: _textEditingController2,
                        validator: (value) {
                          return value.isNotEmpty
                              ? null
                              : "Please type comment";
                        },
                        decoration: InputDecoration(hintText: "Comment"),
                      ),
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Publish'),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      addComment();
                      setState(() {
                        newStream(); //refresh/reset the stream
                      });
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  // this method adds comments to firestore
  Future addComment() async {
    if (formKey.currentState.validate()) {
      getCommentsServices.publishComment(
        username: _textEditingController.text,
        comment: _textEditingController2.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => this.widget));
    } else {
      Fluttertoast.showToast(msg: "Try Again Later");
    }
  }

  @override
  void initState() {
    super.initState();
    stream = newStream(); // initial stream
  }

  Stream<String> newStream() =>
      Stream.periodic(Duration(seconds: 1), (i) => "$i");
  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentsProvider>(context);

    var _firebaseFirestore =
        FirebaseFirestore.instance.collection('Comments').snapshots();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          commentDialog(context);
        },
        label: const Text('Add Comment'),
        icon: const Icon(Icons.comment),
        backgroundColor: Colors.orange,
      ),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.white.withOpacity(0.8),
        title: Text(
          'Comments Section',
          textAlign: TextAlign.center,
          style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
        ),
      ),
      body: Stack(
        children: [
          Image.asset('images/taxi1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              // width: double.infinity,
              color: Colors.yellow[50].withOpacity(0.85),
              colorBlendMode: BlendMode.srcOver),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(8, 8, 8, 64.8),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: commentProvider.comments
          //           .map((item) => GestureDetector(
          //                 child: CommentsTile(
          //                   comment: item,
          //                 ),
          //               ))
          //           .toList(),
          //     ),
          //   ),
          // ),

          //this method retrieves comments from firestore
          stream = StreamBuilder(
              stream: _firebaseFirestore,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // setState(() {

                return ListView.builder(
                    itemCount: commentProvider.comments.length,
                    itemBuilder: (context, index) {
                      CommentsModel _pubcomment =
                          commentProvider.comments[index];
                      return CommentsTile(
                        comment: _pubcomment,
                      );
                    });

                //  });
                //     ListView(
                //         children: snapshot.data.docs.map((taxi) {
                //   CommentsTile(
                //     comment: taxi,
                //   );
                // }).toList());
              }),
        ],
      ),
    );
  }
}
