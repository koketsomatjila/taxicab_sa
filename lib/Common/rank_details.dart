import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxicab_sa/models/taxi_rank_model.dart';
import 'package:transparent_image/transparent_image.dart';

class RankDetails extends StatefulWidget {
  final TaxiRankModel rank;
  const RankDetails({Key key, this.rank}) : super(key: key);

  @override
  _RankDetailsState createState() => _RankDetailsState();
}

class _RankDetailsState extends State<RankDetails> {
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
        Column(
          children: [
            Container(
              color: Colors.white.withOpacity(0.8),
            ),
            Container(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.rank.picture,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 383.5,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        children: [
                          //           Padding(
                          //   padding: const EdgeInsets.fromLTRB(8, 18, 8, 18.0),
                          //   child: Text(
                          //     widget.rank.name.toString(),
                          //     style: TextStyle(
                          //       fontSize: 25,
                          //     ),
                          //   ),
                          // ),
                          TextSpan(
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold),
                              text: '${widget.rank.name}\n\n'),
                          TextSpan(
                              style: GoogleFonts.ubuntu(),
                              text: widget.rank.destinations),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
