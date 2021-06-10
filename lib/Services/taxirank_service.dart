import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxicab_sa/models/taxi_rank_model.dart';
// import 'dart:async';

class TaxiRankServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "Taxi Ranks";

  Future<List<TaxiRankModel>> getRanks() async =>
      _firestore.collection(collection).get().then((result) {
        List<TaxiRankModel> taxiRanks = [];
        for (DocumentSnapshot taxiRank in result.docs) {
          taxiRanks.add(TaxiRankModel.fromSnapshot(taxiRank));
        }
        return taxiRanks;
      });

  Future<List<TaxiRankModel>> getRankGauteng({String province}) async =>
      _firestore
          .collection(collection)
          .where("Province", isEqualTo: 'Gauteng')
          .orderBy('Name', descending: false)
          .get()
          .then((result) {
        List<TaxiRankModel> taxiRanks = [];
        for (DocumentSnapshot taxiRank in result.docs) {
          taxiRanks.add(TaxiRankModel.fromSnapshot(taxiRank));
        }
        return taxiRanks;
      });
  Future<List<TaxiRankModel>> getRankWC({String province}) async => _firestore
          .collection(collection)
          .where("Province", isEqualTo: 'Western Cape')
          .orderBy('Name', descending: false)
          .get()
          .then((result) {
        List<TaxiRankModel> taxiRanks = [];
        for (DocumentSnapshot taxiRank in result.docs) {
          taxiRanks.add(TaxiRankModel.fromSnapshot(taxiRank));
        }
        return taxiRanks;
      });
  Future<List<TaxiRankModel>> getRankNW({String province}) async => _firestore
          .collection(collection)
          .where("Province", isEqualTo: 'North West')
          .orderBy('Name', descending: false)
          .get()
          .then((result) {
        List<TaxiRankModel> taxiRanks = [];
        for (DocumentSnapshot taxiRank in result.docs) {
          taxiRanks.add(TaxiRankModel.fromSnapshot(taxiRank));
        }
        return taxiRanks;
      });
  Future<List<TaxiRankModel>> searchGP({String province}) async => _firestore
          .collection(collection)
          .where(
            "Province",
            isEqualTo: 'Gauteng',
          )
          .get()
          .then((result) {
        List<TaxiRankModel> taxiRanks = [];
        for (DocumentSnapshot taxiRank in result.docs) {
          taxiRanks.add(TaxiRankModel.fromSnapshot(taxiRank));
        }
        return taxiRanks;
      });
}
