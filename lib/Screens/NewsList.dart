import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:taxicab_sa/Common/article_details.dart';
import 'package:taxicab_sa/Common/news_article_tile.dart';
import 'package:taxicab_sa/Provider/news_article_provider.dart';
// import 'package:taxicab_sa/Common/Drawer.dart';

class News extends StatefulWidget {
  // News({Key key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<NewsArticleProvider>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.orange),
          backgroundColor: Colors.white.withOpacity(0.8),
          title: Text(
              'Taxi Cab SA',
              textAlign: TextAlign.center,
              style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
            
          ),
        ),
        // drawer: AppDrawer(),
        body: Stack(children: [
          Image.asset('images/taxi1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              // width: double.infinity,
              color: Colors.yellow[700].withOpacity(0.5),
              colorBlendMode: BlendMode.srcOver),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                  children: articleProvider.articles
                      .map((item) => GestureDetector(
                            child: ArticleTile(
                              article: item,
                            ),
                          ))
                      .toList()),
            ),
          ),
        ]));
  }
}
