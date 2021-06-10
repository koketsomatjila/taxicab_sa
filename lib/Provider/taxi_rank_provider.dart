import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:taxicab_sa/Services/taxirank_service.dart';
import 'package:taxicab_sa/models/taxi_rank_model.dart';

class TaxiRankProvider with ChangeNotifier {
  List<TaxiRankModel> taxiRanks = [];
  List<TaxiRankModel> taxiRanksGP = [];
  List<TaxiRankModel> taxiRanksWC = [];
  List<TaxiRankModel> taxiRanksNW = [];
  List<TaxiRankModel> ranksSearched = [];
  TaxiRankServices _rankServices = TaxiRankServices();

  TaxiRankProvider.initialize() {
    loadRanks();
  }

  loadRanks() async {
    taxiRanks = await _rankServices.getRanks();
    taxiRanksGP = await _rankServices.getRankGauteng();
    taxiRanksWC = await _rankServices.getRankWC();
    taxiRanksNW = await _rankServices.getRankNW();

    notifyListeners();
  }

  Future loadRanksByProvince({String provinceName}) async {
    taxiRanksGP = await _rankServices.getRankGauteng(province: 'Gauteng');
    taxiRanksWC = await _rankServices.getRankWC(province: 'Western Cape');
    taxiRanksNW = await _rankServices.getRankNW(province: 'North West');

    notifyListeners();
  }

  Future search({String rankName}) async {
    ranksSearched = await _rankServices.searchGP();
    notifyListeners();
  }
}
