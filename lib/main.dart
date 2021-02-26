import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxicab_sa/Provider/news_article_provider.dart';
import 'package:taxicab_sa/Provider/taxi_rank_provider.dart';
import 'package:taxicab_sa/Screens/Home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: NewsArticleProvider.initialize(),
    ),
    ChangeNotifierProvider.value(
      value: TaxiRankProvider.initialize(),
    )
  ], child: MyApp()));
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
