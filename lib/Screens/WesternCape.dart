import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taxicab_sa/Common/Drawer.dart';
import 'package:taxicab_sa/Common/taxi_rank_tile.dart';
import 'package:taxicab_sa/Provider/taxi_rank_provider.dart';

class WesternCape extends StatefulWidget {
  WesternCape({Key key}) : super(key: key);

  @override
  _WesternCapeState createState() => _WesternCapeState();
}

class _WesternCapeState extends State<WesternCape> {
  @override
  Widget build(BuildContext context) {
    final rankProvider = Provider.of<TaxiRankProvider>(context);

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.orange),
            backgroundColor: Colors.white.withOpacity(0.8),
            actions: [
              IconButton(
                iconSize: 35,
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch3());
                },
              )
            ],
            title: Text(
              'Taxi Cab SA',
              textAlign: TextAlign.center,
              style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
            )),
        drawer: AppDrawer(),
        body: Stack(children: [
          Image.asset('images/cpt.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              // width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              colorBlendMode: BlendMode.darken),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                  children: rankProvider.taxiRanksWC
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

class DataSearch3 extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Taxi Ranks')
          // .orderBy('Name', descending: false)
          .where("Province", isEqualTo: 'Western Cape')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: new Text('Loading...'));
        if (query.isEmpty)
          return Center(child: new Text('Let\'s find you that taxi...'));

        final results = snapshot.data.docs.where((DocumentSnapshot snapshot) =>
            snapshot
                .data()
                .toString()
                .contains(RegExp(query, caseSensitive: false)));

        return ListView(
          children: results
              .map<Widget>(
                (snapshot) => Padding(
                  padding: EdgeInsets.fromLTRB(4, 14, 4, 4),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200].withOpacity(0.85),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(snapshot.get('Name').toString()))),
                ),
              )
              .toList(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Taxi Ranks')
          // .orderBy('Name', descending: false)
          .where("Province", isEqualTo: 'Western Cape')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: new Text('Loading...'));
        if (query.isEmpty)
          return Center(child: new Text('Let\'s find you that taxi...'));

        final results = snapshot.data.docs.where((DocumentSnapshot snapshot) =>
            snapshot
                .data()
                .toString()
                .contains(RegExp(query, caseSensitive: false)));

        return ListView(
          children: results
              .map<Widget>(
                (snapshot) => Padding(
                  padding: EdgeInsets.fromLTRB(4, 14, 4, 4),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200].withOpacity(0.85),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(snapshot.get('Name').toString()))),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
