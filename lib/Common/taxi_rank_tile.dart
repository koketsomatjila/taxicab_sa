import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxicab_sa/Common/article_details.dart';
import 'package:taxicab_sa/Common/rank_details.dart';
import 'package:taxicab_sa/Common/screen_navigation.dart';
import 'package:taxicab_sa/Provider/news_article_provider.dart';
import 'package:taxicab_sa/models/news_article_model.dart';
import 'package:taxicab_sa/models/taxi_rank_model.dart';
import 'package:transparent_image/transparent_image.dart';

class TaxiRankTile extends StatelessWidget {
  final TaxiRankModel rank;

  const TaxiRankTile({Key key, this.rank}) : super(key: key);

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
        child: InkWell(
          onTap: () {
            changeScreen(context, RankDetails(rank: rank));
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                _articleImage(rank.picture),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 275,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: '${rank.name} ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ], style: TextStyle(color: Colors.black)),
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
            image: rank.picture,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
