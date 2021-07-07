import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:taxicab_sa/Common/article_details.dart';
import 'package:taxicab_sa/Common/screen_navigation.dart';
// import 'package:taxicab_sa/Provider/news_article_provider.dart';
import 'package:taxicab_sa/models/news_article_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleTile extends StatelessWidget {
  final NewsArticleModel article;

  const ArticleTile({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final articleProvider = Provider.of<NewsArticleProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300].withOpacity(0.85),
          borderRadius: BorderRadius.circular(10),

          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black, offset: Offset(-2, -1), blurRadius: 5),
          // ],
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                changeScreen(context, ArticleDetails(article: article));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 1),
                child: Row(
                  children: <Widget>[
                    _articleImage(article.picture),
                    Flexible(
                      child: Container(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: '${article.title} ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ], style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 1, 8, 1),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      '${article.date.toDate().day}-${article.date.toDate().month}-${article.date.toDate().year}',
                      style: TextStyle(
                          height: 2,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                      // textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _articleImage(String picture) {
    if (picture == null) {
      return Container(child: Text("No Image"));
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: article.picture,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
