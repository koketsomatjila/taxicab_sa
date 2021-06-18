import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxicab_sa/Common/Drawer.dart';

class RankMap extends StatefulWidget {
  RankMap({Key key}) : super(key: key);

  @override
  _RankMapState createState() => _RankMapState();
}

class _RankMapState extends State<RankMap> {
  @override
  Widget build(BuildContext context) {
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
        drawer: AppDrawer(),
        body: Stack(children: [
          Image.asset('images/taxi1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              // width: double.infinity,
              color: Colors.yellow[700].withOpacity(0.5),
              colorBlendMode: BlendMode.srcOver),
        ]));
  }
}
