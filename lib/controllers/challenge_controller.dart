import 'dart:convert';

import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyAcces = "listProduitGagnant";
const String keyAccesUserDrop = "UserDrop";

class Challengecontroller extends ChangeNotifier {
  late SharedPreferences _localData;
  UserDrop _userDrop =
      UserDrop(email: '', nom: '', photo: '', prenom: '', telephone: '');
  late SharedPreferences _localDataUserDrop;
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
    _initChallengeListStartChallenge();
    notifyListeners();
  }

  void _initChallengeListStartChallenge() async {
    _localDataUserDrop = await SharedPreferences.getInstance();
    Map<String, dynamic> _jsonDecodeUserDrop;
    final String? _tempListChallenge =
        _localDataUserDrop.getString(keyAccesUserDrop);
    if (_tempListChallenge != null) {
      _jsonDecodeUserDrop = jsonDecode(_tempListChallenge);
      _userDrop = UserDrop.fromJSON(_jsonDecodeUserDrop);
    }
  }
}
