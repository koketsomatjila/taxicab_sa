// // import 'dart:ffi';

// import 'package:comment_box/comment/comment.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Chat extends StatefulWidget {
//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController commentController = TextEditingController();
//   List filedata = [
//     // {
//     //   'name': 'Adeleye Ayodeji',
//     //   'pic': 'https://picsum.photos/300/30',
//     //   'message': 'I love to code'
//     // },
//     // {
//     //   'name': 'Biggi Man',
//     //   'pic': 'https://picsum.photos/300/30',
//     //   'message': 'Very cool'
//     // },
//     // {
//     //   'name': 'Biggi Man',
//     //   'pic': 'https://picsum.photos/300/30',
//     //   'message': 'Very cool'
//     // },
//     // {
//     //   'name': 'Biggi Man',
//     //   'pic': 'https://picsum.photos/300/30',
//     //   'message': 'Very cool'
//     // },
//   ];

//   Widget commentChild(data) {
//     return ListView(
//       children: [
//         for (var i = 0; i < data.length; i++)
//           Padding(
//             padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
//             child: ListTile(
//               leading: GestureDetector(
//                 child: Container(
//                   height: 50.0,
//                   width: 50.0,
//                   decoration: new BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: new BorderRadius.all(Radius.circular(50))),
//                   child: CircleAvatar(
//                       radius: 50,
//                       backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
//                 ),
//               ),
//               title: Text(
//                 data[i]['name'],
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(data[i]['message']),
//             ),
//           )
//       ],
//     );
//   }

//   @override
//   build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.orange,
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.orange),
//         centerTitle: true,
//         title: Text(
//           "Comments Section",
//           style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
//         ),
//         backgroundColor: Colors.white.withOpacity(0.8),
//       ),
//       body: Stack(
//         children: [
//           Image.asset('images/taxi1.jpg',
//               fit: BoxFit.cover,
//               height: double.infinity,
//               // width: double.infinity,
//               color: Colors.yellow[100].withOpacity(0.8),
//               colorBlendMode: BlendMode.srcOver),
//           CommentBox(
//             userImage: 'images/tcsalogo.jpg',
//             child: commentChild(filedata),
//             labelText: 'Write a comment...',
//             withBorder: false,
//             errorText: 'Comment cannot be blank',
//             sendButtonMethod: () {
//               if (formKey.currentState.validate()) {
//                 print(commentController.text);
//                 setState(() {
//                   var value = {
//                     'name': 'Taxi Cab SA User',
//                     'pic': 'images/tcsalogo.jpg',
//                     'message': commentController.text
//                   };
//                   filedata.insert(0, value);
//                 });
//                 commentController.clear();
//                 // FocusScope.of(context).unfocus();
//               } else {
//                 print("Not validated");
//               }
//             },
//             formKey: formKey,
//             commentController: commentController,
//             backgroundColor: Colors.white.withOpacity(0.6),
//             textColor: Colors.black,
//             sendWidget:
//                 Icon(Icons.send_rounded, size: 30, color: Colors.orange),
//           ),
//         ],
//       ),
//     );
//   }
// }
