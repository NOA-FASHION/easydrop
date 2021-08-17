import 'dart:convert';
import 'dart:ffi';

import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyAcces = "listProduitGagnant";
const String keyAccesUserDrop = "UserDrop";
List<ProduitGagnant> _listProduitGagnant = [];

class Challengecontroller extends ChangeNotifier {
  late SharedPreferences _localData;
  UserDrop _userDrop = UserDrop(
      email: '',
      nom: '',
      photo: '',
      prenom: '',
      telephone: '',
      infoRecupere: false);
  late SharedPreferences _localDataUserDrop;
  Challengecontroller() {
    _initProduitGagnantList();
  }

  void _initProduitGagnantList() async {
    _localData = await SharedPreferences.getInstance();

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
    _initUserDrop();
    notifyListeners();
  }

  void _initUserDrop() async {
    _localDataUserDrop = await SharedPreferences.getInstance();
    Map<String, dynamic> _jsonDecodeUserDrop;
    final String? _tempListChallenge =
        _localDataUserDrop.getString(keyAccesUserDrop);
    if (_tempListChallenge != null) {
      _jsonDecodeUserDrop = jsonDecode(_tempListChallenge);
      _userDrop = UserDrop.fromJSON(_jsonDecodeUserDrop);
    }
  }

  bool getInfoRecupere() {
    return _userDrop.infoRecupere;
  }

  addUserDropp(
      {required bool infoRecupere,
      required String nom,
      required String prenom,
      required String email,
      required String telephone,
      required String photo}) async {
    _userDrop.infoRecupere = infoRecupere;
    _userDrop.nom = nom;
    _userDrop.prenom = prenom;
    _userDrop.email = email;
    _userDrop.telephone = telephone;
    _userDrop.photo = photo;
    await _saveUserDropp();
    _initUserDrop();
  }

  Future<bool> _saveUserDropp() async {
    Map mapday = _userDrop.toJson();
    String _jsonDay = jsonEncode(mapday);
    return _localData.setString(keyAccesUserDrop, _jsonDay);
  }

  void addProductGagant(
      {required String siteVente,
      required double prixShipping,
      required String siteAliexpress,
      required String nomProduit,
      required double chiffreAffaireTotal,
      required double coutTotalProduit,
      required String facebookAdress,
      required double facebookDepenseTotal,
      required double margeTotal,
      required double prixAchat,
      required double prixShippingTotal,
      required double prixVente,
      required double roaTotal,
      required double venteTotal,
      required int vueTotal,
      required List<Offre> listeOffre,
      required List<ResultJournee> listeResultatJournee,
      required String photoProduit,
      required String typeDuProduit,
      required int panierTotal,
      required List<String> nombreVenteOffreTotal}) async {
    _listProduitGagnant.add(
      ProduitGagnant(
          chiffreAffaireTotal: chiffreAffaireTotal,
          coutTotalProduit: coutTotalProduit,
          facebookAdress: facebookAdress,
          facebookDepenseTotal: facebookDepenseTotal,
          listeOffre: listeOffre,
          listeResultatJournee: listeResultatJournee,
          margeTotal: margeTotal,
          panierTotal: panierTotal,
          nombreVenteOffreTotal: nombreVenteOffreTotal,
          photoProduit: photoProduit,
          prixAchat: prixAchat,
          prixShippingTotal: prixShippingTotal,
          prixVente: prixVente,
          roaTotal: roaTotal,
          typeDuProduit: typeDuProduit,
          venteTotal: venteTotal,
          vueTotal: vueTotal,
          nomProduit: nomProduit,
          siteAliexpress: siteAliexpress,
          siteVente: siteVente,
          prixShipping: prixShipping),
    );

    await _save(remove: false);
    _initProduitGagnantList();
    notifyListeners();
  }

  Future<bool> _save({required bool remove}) async {
    if (_listProduitGagnant.length < 1 && remove) {
      return _localData.setStringList(keyAcces, []);
    }
    if (_listProduitGagnant.isNotEmpty) {
      List<String> _jsonList = _listProduitGagnant.map((challenge) {
        return jsonEncode(challenge.toJson());
      }).toList();
      return _localData.setStringList(keyAcces, _jsonList);
    }

    return false;
  }
}
