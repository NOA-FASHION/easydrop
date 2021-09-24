import 'dart:convert';
// import 'dart:ffi';

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

  List<ProduitGagnant> getProduitGagnant() {
    return _listProduitGagnant;
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
      {required String idProduct,
      required String siteVente,
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
          id: idProduct,
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

  Future<bool> _saveOffre(
      {required bool remove, required String idProduct}) async {
    for (var i = _listProduitGagnant.length - 1; i >= 0; i--) {
      if (_listProduitGagnant[i].id == idProduct) {
        if (_listProduitGagnant[i].listeOffre.length < 1 && remove) {
          _listProduitGagnant[i].listeOffre = [];
          List<String> _jsonList = _listProduitGagnant.map((produit) {
            return jsonEncode(produit.toJson());
          }).toList();
          return _localData.setStringList(keyAcces, _jsonList);
        }
      }
    }
    return false;
  }

  Future<bool> _saveResultatDays(
      {required bool remove, required String idProduct}) async {
    for (var i = _listProduitGagnant.length - 1; i >= 0; i--) {
      if (_listProduitGagnant[i].id == idProduct) {
        if (_listProduitGagnant[i].listeResultatJournee.length < 1 && remove) {
          _listProduitGagnant[i].listeResultatJournee = [];
          List<String> _jsonList = _listProduitGagnant.map((produit) {
            return jsonEncode(produit.toJson());
          }).toList();
          return _localData.setStringList(keyAcces, _jsonList);
        }
      }
    }
    return false;
  }

  void remove({
    required int index,
  }) async {
    // await removeChallengelistId(index);
    _listProduitGagnant.removeAt(index);
    await _save(remove: true);
    _initProduitGagnantList();
    notifyListeners();
  }

  void removeResultatDays({
    required int index,
    required int indexProduct,
    required String idProduct,
  }) async {
    _listProduitGagnant[indexProduct].listeOffre.removeAt(index);
    await _saveResultatDays(remove: true, idProduct: idProduct);
    _initProduitGagnantList();
    notifyListeners();
  }

  void removeOffre({
    required int index,
    required int indexProduct,
    required String idProduct,
  }) async {
    _listProduitGagnant[indexProduct].listeOffre.removeAt(index);
    await _saveOffre(remove: true, idProduct: idProduct);
    _initProduitGagnantList();
    notifyListeners();
  }

  void addOffreDays(
      {required int index,
      required double prixAchat,
      required double prixVente,
      required double prixBarre,
      required double margeOffre,
      required double roas,
      required List<String> offres}) async {
    List<Offre> offreday = [];
    offreday.add(Offre(
        margeOffre: margeOffre,
        prixAchat: prixAchat,
        prixBarre: prixBarre,
        prixVente: prixVente,
        roas: roas,
        offres: offres));
    addOffreDays1(index: index, offreday: offreday);
    await _save(remove: false);
    _initProduitGagnantList();
    notifyListeners();
  }

  void addOffreDays1(
      {required List<Offre> offreday, required int index}) async {
    _listProduitGagnant[index].listeOffre.add(Offre(
        prixAchat: offreday[0].prixAchat,
        prixVente: offreday[0].prixVente,
        prixBarre: offreday[0].prixBarre,
        margeOffre: offreday[0].margeOffre,
        roas: offreday[0].roas,
        offres: offreday[0].offres));
  }

  void addResultatDays({
    required int index,
    required double chiffreAffaireDays,
    required double prixShippingDays,
    required double facebookDepenseDays,
    required double coutDaysProduit,
    required double margeDays,
    required double venteDays,
    required double roaDays,
    required int panierDays,
    required int vueDays,
    required List<String> nombreVenteOffreDays,
  }) async {
    List<ResultJournee> _resultatDays = [];
    _resultatDays.add(ResultJournee(
        chiffreAffaireDays: chiffreAffaireDays,
        prixShippingDays: prixShippingDays,
        facebookDepenseDays: facebookDepenseDays,
        coutDaysProduit: coutDaysProduit,
        margeDays: margeDays,
        roaDays: roaDays,
        panierDays: panierDays,
        vueDays: vueDays,
        nombreVenteOffreDays: nombreVenteOffreDays,
        venteDays: venteDays));

    addresultDays(index: index, resultday: _resultatDays);

    await _save(remove: false);
    _initProduitGagnantList();
    notifyListeners();
  }

  void addresultDays(
      {required List<ResultJournee> resultday, required int index}) async {
    _listProduitGagnant[index].listeResultatJournee.add(ResultJournee(
        chiffreAffaireDays: resultday[0].chiffreAffaireDays,
        prixShippingDays: resultday[0].prixShippingDays,
        facebookDepenseDays: resultday[0].facebookDepenseDays,
        coutDaysProduit: resultday[0].coutDaysProduit,
        margeDays: resultday[0].margeDays,
        venteDays: resultday[0].venteDays,
        roaDays: resultday[0].roaDays,
        panierDays: resultday[0].panierDays,
        vueDays: resultday[0].vueDays,
        nombreVenteOffreDays: resultday[0].nombreVenteOffreDays));
  }

  List<ResultJournee> getResulDays(String id) {
    List<ResultJournee> resulDays = [];
    for (var i = _listProduitGagnant.length - 1; i >= 0; i--) {
      if (_listProduitGagnant[i].id == id) {
        resulDays = _listProduitGagnant[i].listeResultatJournee;
      }
    }
    return resulDays;
  }

  List<Offre> getOffresProduct(String id) {
    List<Offre> offreProduct = [];
    for (var i = _listProduitGagnant.length - 1; i >= 0; i--) {
      if (_listProduitGagnant[i].id == id) {
        offreProduct = _listProduitGagnant[i].listeOffre;
      }
    }
    return offreProduct;
  }
}
