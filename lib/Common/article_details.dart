import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxicab_sa/models/news_article_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleDetails extends StatefulWidget {
  final NewsArticleModel article;
  const ArticleDetails({Key key, this.article}) : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.white.withOpacity(0.8),
        title: Flexible(
          child: (Text(
            'Taxi Cab SA',
            textAlign: TextAlign.center,
            style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
          )),
        ),
      ),
      body: Stack(children: [
        Image.asset('images/taxi1.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            // width: double.infinity,
            color: Colors.yellow[700].withOpacity(0.5),
            colorBlendMode: BlendMode.srcOver),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.white.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 18, 8, 18.0),
                    child: Text(
                      widget.article.title.toString(),
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  )),
              Container(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.article.picture,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                color: Colors.white.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            style: GoogleFonts.ubuntu(),
                            text: widget.article.article)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
