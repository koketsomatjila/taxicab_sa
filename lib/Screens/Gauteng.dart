// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taxicab_sa/Common/Drawer.dart';
import 'package:taxicab_sa/Common/rank_details.dart';
import 'package:taxicab_sa/Common/screen_navigation.dart';
import 'package:taxicab_sa/Common/taxi_rank_tile.dart';
import 'package:taxicab_sa/Provider/taxi_rank_provider.dart';
import 'package:taxicab_sa/models/taxi_rank_model.dart';

class Gauteng extends StatefulWidget {
  Gauteng({Key key, this.rank}) : super(key: key);
  final TaxiRankModel rank;

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
        actions: [
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
        title: Flexible(
          child: (Text(
            'Taxi Cab SA',
            textAlign: TextAlign.center,
            style: GoogleFonts.aclonica(color: Colors.orange, fontSize: 25),
          )),
        ),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          Image.asset('images/jhb.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              colorBlendMode: BlendMode.srcOver),
          SingleChildScrollView(
            child: Column(
              children: rankProvider.taxiRanksGP
                  .map((item) => GestureDetector(
                        child: TaxiRankTile(
                          rank: item,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  DataSearch({Key key, this.rank});
  final TaxiRankModel rank;
  RankDetails rankDetails = RankDetails();

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
    TaxiRankProvider.initialize();

    RankDetails rankDetails = RankDetails(
      rank: rank,
    );
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Taxi Ranks')
          // .orderBy('Name', descending: false)
          .where("Province", isEqualTo: 'Gauteng')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: new Text('Loading...'));
        if (query.isEmpty)
          return Center(child: new Text('Let\'s find you that taxi...'));

        final results = snapshot.data.docs.where((DocumentSnapshot snapshot) =>
            snapshot.data().toString().contains(query));

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
                        child: Text(snapshot.get('Name').toString()),
                      )),
                ),
              )
              .toList(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final rankProvider = Provider.of<TaxiRankProvider>(context);

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Taxi Ranks')
          .where("Province", isEqualTo: 'Gauteng')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: new Text('Loading...'));
        if (query.isEmpty)
          return Center(child: new Text('Let\'s find you that taxi...'));

        final results = snapshot.data.docs
            .where((DocumentSnapshot a) => a.data().toString().contains(query));

        return ListView(
          children: results
              .map<Widget>((a) => GestureDetector(
                    onTap: () {
                      changeScreen(context, RankDetails());
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 14, 4, 4),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300].withOpacity(0.85),
                            // borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(a.get('Name').toString()),
                          )),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
