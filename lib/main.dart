import 'package:flutter/material.dart';
import 'package:taxicab_sa/Screens/Home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        theme: ThemeData(
            textTheme:
                GoogleFonts.aclonicaTextTheme(Theme.of(context).textTheme)));
  }
}
