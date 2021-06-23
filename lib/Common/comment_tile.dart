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
          color: Colors.black.withOpacity(0.65),
          borderRadius: BorderRadius.circular(40),
        ),
        child: InkWell(
          onTap: () {
            // changeScreen(context, commentDetails(comment: comment));
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
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
                    foregroundImage: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/taxi-cab-sa.appspot.com/o/tcsalogo.jpg?alt=media&token=7939b099-d2f1-46c8-ae0d-f92a86a28f01',
                    ),
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
                            text: '${comment.username} \n\n',
                            style: GoogleFonts.aclonica(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          ),
                          TextSpan(
                            text: '${comment.comment} ',
                            style: GoogleFonts.aclonica(
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 17),
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
