import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxicab_sa/models/comments_model.dart';

class CommentsTile extends StatelessWidget {
  final CommentsModel comment;

  const CommentsTile({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              // offset: Offset(0, 3),
            )
          ],
          // color: Colors.black.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            // changeScreen(context, commentDetails(comment: comment));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(
              children: <Widget>[
                Container(
                  width: 70,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: NetworkImage(
                  //       'https://firebasestorage.googleapis.com/v0/b/taxi-cab-sa.appspot.com/o/tcsalogo.jpg?alt=media&token=7939b099-d2f1-46c8-ae0d-f92a86a28f01',
                  //     ),
                  //   ),
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/taxi-cab-sa.appspot.com/o/Taxi%20Cab%20SA%20icon-02.jpg?alt=media&token=853a0645-b106-4b1c-8153-3be6d97d7398',
                        scale: 90),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 275,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '${comment.username} \n',
                            style: GoogleFonts.aclonica(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                          TextSpan(
                            text: '${comment.comment} \n',
                            style: GoogleFonts.ubuntu(
                                height: 1.3,
                                // fontWeight: FontWeight.w100,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                          TextSpan(
                            text:
                                '                                                                 ${comment.date.toDate().day}-${comment.date.toDate().month}-${comment.date.toDate().year} ',
                            style: GoogleFonts.aclonica(
                                height: 1.3,
                                fontWeight: FontWeight.w100,
                                color: Colors.black54,
                                fontSize: 10),
                          ),
                        ], style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
