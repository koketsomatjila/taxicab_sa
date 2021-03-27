import 'package:cloud_firestore/cloud_firestore.dart';
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
            color: Colors.yellow[100].withOpacity(0.8),
            colorBlendMode: BlendMode.srcOver),
        Column(
          children: [
            Container(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.rank.picture2,
                height: 230,
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
            ),
            Flexible(
              child: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
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
                          TextSpan(
                              style: GoogleFonts.aclonica(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              text: '${widget.rank.name}\n\n'),
                          TextSpan(
                              style: GoogleFonts.aclonica(fontSize: 30),
                              text: '${widget.rank.location.latitude}\n\n'
                                  .toString()),
                          TextSpan(
                              style: GoogleFonts.aclonica(fontSize: 18),
                              text: widget.rank.destinations
                                  .replaceAll('/n', '\n'))
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
