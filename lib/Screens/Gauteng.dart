import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taxicab_sa/Common/Drawer.dart';
import 'package:taxicab_sa/Common/taxi_rank_tile.dart';
import 'package:taxicab_sa/Provider/taxi_rank_provider.dart';

class Gauteng extends StatefulWidget {
  Gauteng({Key key}) : super(key: key);

  @override
  _GautengState createState() => _GautengState();
}

class _GautengState extends State<Gauteng> {
  @override
  Widget build(BuildContext context) {
    final rankProvider = Provider.of<TaxiRankProvider>(context);

    return Scaffold(
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
        drawer: AppDrawer(),
        body: Stack(children: [
          Image.asset('images/jhb.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              // width: double.infinity,
              // color: Colors.yellow[700].withOpacity(0.5),
              colorBlendMode: BlendMode.srcOver),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                  children: rankProvider.taxiRanksGP
                      .map((item) => GestureDetector(
                            child: TaxiRankTile(
                              rank: item,
                            ),
                          ))
                      .toList()),
            ),
          ),
        ]));
  }
}
