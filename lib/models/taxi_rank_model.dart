import 'package:cloud_firestore/cloud_firestore.dart';

class TaxiRankModel {
  static const DESTINATIONS = 'Destinations';
  static const NAME = 'Name';
  static const PICTURE = 'Picture';
  static const PROVINCE = 'Province';

  String _name;
  String _province;
  String _picture;
  String _destinations;

  String get name => _name;
  String get province => _province;
  String get picture => _picture;
  String get destinations => _destinations;

  TaxiRankModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data();
    _name = data[NAME];
    _province = data[PROVINCE];
    _destinations = data[DESTINATIONS];

    _picture = data[PICTURE];
  }
}
