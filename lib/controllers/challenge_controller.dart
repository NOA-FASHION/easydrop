import 'dart:convert';

import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyAcces = "challengeList";

class Challengecontroller extends ChangeNotifier {
  late SharedPreferences _localData;
  Challengecontroller() {
    _initProduitGagnantList();
  }

  void _initProduitGagnantList() async {
    _localData = await SharedPreferences.getInstance();
    List<ProduitGagnant> _listProduitGagnant = [];
    List<Map<String, dynamic>> _jsonDecodeList;
    final List<String>? _tempList = _localData.getStringList(keyAcces);
    if (_tempList != null) {
      _jsonDecodeList = _tempList
          .map((challengeEncoded) => jsonDecode(challengeEncoded))
          .toList()
          .cast<Map<String, dynamic>>();

      _listProduitGagnant = _jsonDecodeList
          .map((challenge) => ProduitGagnant.fromJSON(challenge))
          .toList();
    }

    notifyListeners();
  }
}
