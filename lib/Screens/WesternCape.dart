import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxicab_sa/Common/Drawer.dart';

class WesternCape extends StatefulWidget {
  WesternCape({Key key}) : super(key: key);

  @override
  _WesternCapeState createState() => _WesternCapeState();
}

class _WesternCapeState extends State<WesternCape> {
  @override
  Widget build(BuildContext context) {
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
          Image.asset('images/cpt.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              // width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              colorBlendMode: BlendMode.darken),
        ]));
  }
}
