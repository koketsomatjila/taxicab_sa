// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taxicab_sa/Common/Drawer.dart';
import 'package:taxicab_sa/Common/taxi_rank_tile.dart';
import 'package:taxicab_sa/Provider/taxi_rank_provider.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:taxicab_sa/models/taxi_rank_model.dart';

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
      body: FloatingSearchBarScrollNotifier(
        child: Stack(
          children: [
            Image.asset('images/jhb.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                colorBlendMode: BlendMode.srcOver),
            SingleChildScrollView(
              // child: Padding(
              //   padding: const EdgeInsets.only(top: 80.0),
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
            // ),
            // buildFloatingSearchBar(),
          ],
        ),
      ),
    );
  }

  // buildFloatingSearchBar() {
  //   final isPortrait =
  //       MediaQuery.of(context).orientation == Orientation.portrait;
  //   String searchKey;
  //   Stream streamQuery;
  //   FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //   return FloatingSearchBar(
  //     automaticallyImplyDrawerHamburger: false,

  //     hint: 'Search...',
  //     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
  //     transitionDuration: const Duration(milliseconds: 400),
  //     transitionCurve: Curves.easeInOut,
  //     physics: const BouncingScrollPhysics(),
  //     axisAlignment: isPortrait ? 0.0 : -1.0,
  //     openAxisAlignment: 0.0,
  //     maxWidth: isPortrait ? 600 : 500,
  //     debounceDelay: const Duration(milliseconds: 500),

  //     onQueryChanged: (query) {
  //       setState(() {
  //         searchKey = query;
  //         streamQuery = _firestore
  //             .collection('Taxi Ranks')
  //             .where('Destinations', isGreaterThanOrEqualTo: searchKey)
  //             .where('Destinations', isLessThan: searchKey + 'z')
  //             .snapshots();
  //       });

  //       // Call your model, bloc, controller here.
  //     },
  //     // Specify a custom transition to be used for
  //     // animating between opened and closed stated.
  //     transition: CircularFloatingSearchBarTransition(),
  //     actions: [
  //       FloatingSearchBarAction(
  //         showIfOpened: false,
  //         child: CircularButton(
  //           icon: const Icon(Icons.place),
  //           onPressed: () {},
  //         ),
  //       ),
  //       FloatingSearchBarAction.searchToClear(
  //         showIfClosed: false,
  //       ),
  //     ],
  //     builder: (context, transition) {
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: Material(
  //           color: Colors.white,
  //           elevation: 4.0,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: Colors.accents.map((color) {
  //               return Container(height: 112, color: color);
  //             }).toList(),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

}

class DataSearch extends SearchDelegate {
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
          // .where("Province", isEqualTo: 'North West')
          .where('Destinations', isGreaterThanOrEqualTo: query)
          .snapshots(),
      // searchKey = value;
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: new Text('Loading...'));

        final results = snapshot.data.docs
            .where((DocumentSnapshot a) => a.data().toString().contains(query));

        return ListView(
            children: results
                .map<Widget>(
                  (a) => Text(
                    a.data().toString(),
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                )
                .toList());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Taxi Ranks')
          .where("Destinations", isGreaterThanOrEqualTo: query)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: new Text('Loading...'));

        final results = snapshot.data.docs
            .where((DocumentSnapshot a) => a.data().toString().contains(query));

        return ListView(
            children: results
                .map<Widget>((a) => Text(a.data().where().toString()))
                .toList());
      },
    );
  }
}
