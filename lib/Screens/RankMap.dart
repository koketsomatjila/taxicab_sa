import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxicab_sa/Common/Drawer.dart';
// import 'package:taxicab_sa/Common/rank_details.dart';
// import 'package:taxicab_sa/Common/screen_navigation.dart';
// import 'package:taxicab_sa/Common/taxi_rank_tile.dart';
// import 'package:taxicab_sa/Provider/taxi_rank_provider.dart';

class RankMap extends StatefulWidget {
  RankMap({Key key}) : super(key: key);

  @override
  _RankMapState createState() => _RankMapState();
}

class _RankMapState extends State<RankMap> {
  GoogleMapController myController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position:
          LatLng(specify['Location'].latitude, specify['Location'].longitude),
      infoWindow: InfoWindow(
        title: specify['Name'],
      ),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    FirebaseFirestore.instance
        .collection('Taxi Ranks')
        .get()
        .then((myRankData) {
      if (myRankData.docs.isNotEmpty) {
        for (int i = 0; i < myRankData.docs.length; i++) {
          initMarker(myRankData.docs[i].data(), myRankData.docs[i].id);
        }
      }
    });
  }

  void initState() {
    getMarkerData();
    _getUserLocation();
    super.initState();
  }

  LatLng currentPostion;
  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set<Marker> getMarker() {
    //   return <Marker>[
    //     Marker(
    //         markerId: MarkerId('Bree'),
    //         position: LatLng(-26.32409940697854, 28.18073530954943),
    //         icon: BitmapDescriptor.defaultMarkerWithHue(
    //             BitmapDescriptor.hueAzure),
    //         infoWindow: InfoWindow(title: 'Bree rank'))
    //   ].toSet();
    // }

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
          // Image.asset('images/taxi1.jpg',
          //     fit: BoxFit.cover,
          //     height: double.infinity,
          //                   color: Colors.yellow[700].withOpacity(0.5),
          //     colorBlendMode: BlendMode.srcOver),
          GoogleMap(
            markers: Set<Marker>.of(markers.values),
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: currentPostion, zoom: 15, tilt: 50),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              myController = controller;
            },
          )
        ]));
  }
}
