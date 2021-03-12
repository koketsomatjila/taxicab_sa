import 'package:cloud_firestore/cloud_firestore.dart';

class TaxiRankModel {
  static const DESTINATIONS = 'Destinations';
  static const NAME = 'Name';
  static const PICTURE = 'Picture';
  static const PICTURE2 = 'Picture2';
  static const PROVINCE = 'Province';
  static const LOCATION = 'Location';

  String _name;
  String _province;
  String _picture;
  String _picture2;
  String _destinations;
  // GeoPoint _location;

  String get name => _name;
  String get province => _province;
  String get picture => _picture;
  String get picture2 => _picture2;
  String get destinations => _destinations;
  // GeoPoint get location => _location;

  TaxiRankModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _name = data[NAME];
    _province = data[PROVINCE];
    _destinations = data[DESTINATIONS];
    // _location = data[LOCATION];
    _picture = data[PICTURE];
    _picture2 = data[PICTURE2];
  }
}
