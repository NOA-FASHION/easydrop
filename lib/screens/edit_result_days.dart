import 'dart:io';

import 'package:currency_textfield/currency_textfield.dart';
import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditResultDays extends StatefulWidget {
  final int indexProduct;
  final int indexResultDays;
  final String idProduct;
  EditResultDays(
      {required this.indexResultDays,
      required this.idProduct,
      required this.indexProduct,
      Key? key})
      : super(key: key);

  @override
  _EditResultDaysState createState() => _EditResultDaysState();
}

class _EditResultDaysState extends State<EditResultDays> {
  var controller = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double chiffreAffaireDays = 0;
  double facebookDepenseDays = 0;
  double facebookDepenseTotal = 0;
  int panierDays = 0;
  int vueDays = 0;
  double margeTotal = 0;
  double prixShippingTotal = 0;
  double venteTotal = 0.0;
  double venteDays = 0;
  double margeDays = 0;
  List<String> nombreVenteOffreDays = [];
  double coutDaysProduit = 0;
  double prixShippingDays = 0;
  double roaDays = 0;

  String photoProduit = "";
  Widget offreVente(
      List<ProduitGagnant> _listProduitGagnant, int indexProduitGagnant) {
    Widget offreVentes = SizedBox(
      height: .0,
    );

    for (var i = _listProduitGagnant[indexProduitGagnant].listeOffre.length - 1;
        i >= 0;
        i--) {
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          style: TextStyle(fontSize: 10),
          textCapitalization: TextCapitalization.sentences,
          onSaved: (value) {
            nombreVenteOffreDays.add(value!);
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Merci d'entrer le nombre de vente concernant l'offre " +
                  (i + 1).toString();
            } else if (value.length > 35) {
              return "Pas plus de 50 caractères";
            }
            return null;
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(15.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(15.0)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            labelText: "Offre " + (i + 1).toString(),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      );
    }

    return offreVentes;
  }

  double chiffreAffaire(
      {required List<String> venteOffre, required List<Offre> offreEnCours}) {
    double chiffreAffaires = 0;
    for (var i = offreEnCours.length - 1; i >= 0; i--) {
      chiffreAffaires = chiffreAffaires +
          (offreEnCours[i].prixVente * double.parse(venteOffre[i]));
    }

    return chiffreAffaires;
  }

  double totalNombreVante(
      {required List<String> venteOffre, required List<Offre> offreEnCours}) {
    double nombreVante = 0;
    for (var i = venteOffre.length - 1; i >= 0; i--) {
      nombreVante = nombreVante + int.parse(venteOffre[i]);
    }

    return nombreVante;
  }

  double shippingDaysCalcul(
      {required List<String> venteOffre, required List<Offre> offreEnCours}) {
    double shipping = 0;
    for (var i = offreEnCours.length - 1; i >= 0; i--) {
      shipping = shipping +
          (offreEnCours[i].prixShipping * double.parse(venteOffre[i]));
    }
    return shipping;
  }

  double coutProductDaysCalcul(
      {required List<String> venteOffre, required List<Offre> offreEnCours}) {
    double prixProduit = 0;
    for (var i = offreEnCours.length - 1; i >= 0; i--) {
      prixProduit = prixProduit +
          (offreEnCours[i].prixAchat * double.parse(venteOffre[i]));
    }
    return prixProduit;
  }

  double margeDaysCalcul(
      {required List<String> venteOffre,
      required List<Offre> offreEnCours,
      required double coutPub}) {
    double margeDays = 0;
    for (var i = offreEnCours.length - 1; i >= 0; i--) {
      margeDays = margeDays +
          (offreEnCours[i].margeOffre * double.parse(venteOffre[i]));
    }
    margeDays = margeDays - coutPub;
    return margeDays;
  }

  double roaDaysCalcul(
      {required List<String> venteOffre, required List<Offre> offreEnCours}) {
    double roaDays = 0;
    for (var i = offreEnCours.length - 1; i >= 0; i--) {
      roaDays = roaDays + (offreEnCours[i].roas * double.parse(venteOffre[i]));
    }
    return roaDays;
  }

  @override
  Widget build(BuildContext context) {
    Challengecontroller variable = Provider.of<Challengecontroller>(context);
    List<Offre> offreDays = variable.getOffresProduct(widget.idProduct);
    List<ResultJournee> _resultatDaysList =
        variable.getResulDays(widget.idProduct);
    return AlertDialog(
      contentPadding: EdgeInsets.all(1),
      backgroundColor: Colors.transparent,
      scrollable: true,
      content: Center(
        child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 1.5,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Card(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 15.0,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[Colors.orange, Colors.pink])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.0,
                            ),
                            ///////////////////////////////////
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.file(
                                  File(variable
                                      .getProduitGagnant()[widget.indexProduct]
                                      .photoProduit),
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 11,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: 235,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: controller,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onSaved: (value) {
                                    // facebookDepenseDays = double.parse(value!);
                                    facebookDepenseDays =
                                        controller.doubleValue;
                                  },
                                  validator: (value) {
                                    if (value!.length > 35) {
                                      return "Pas plus de 50 caractères";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    helperStyle: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    helperText: "valeure actuelle: " +
                                        _resultatDaysList[
                                                widget.indexResultDays]
                                            .facebookDepenseDays
                                            .toString(),
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.blueAccent),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Colors.blueAccent),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    labelText: "Dépense Facebook",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: 235,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onSaved: (value) {
                                    panierDays = int.parse(value!);
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Merci d'entrer le nombre de panier de la journée";
                                    } else if (value.length > 35) {
                                      return "Pas plus de 50 caractères";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    helperStyle: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    helperText: "valeure actuelle: " +
                                        _resultatDaysList[
                                                widget.indexResultDays]
                                            .panierDays
                                            .toString(),
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.blueAccent),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Colors.blueAccent),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    labelText: "Nombre de panier de la journée",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: 235,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  onSaved: (value) {
                                    vueDays = int.parse(value!);
                                  },
                                  validator: (value) {
                                    if (value!.length > 35) {
                                      return "Pas plus de 50 caractères";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    helperStyle: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    helperText: "valeure actuelle: " +
                                        _resultatDaysList[
                                                widget.indexResultDays]
                                            .vueDays
                                            .toString(),
                                    labelStyle: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2.0,
                                            color: Colors.blueAccent),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Colors.blueAccent),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    labelText: "le nombre de vue de la journée",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: 250,
                              height: offreDays.length > 3 ? 260 : 140,
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: offreDays.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      margin: EdgeInsets.only(top: 10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          onSaved: (value) {
                                            nombreVenteOffreDays.add(value!);
                                          },
                                          validator: (value) {
                                            if (value!.length > 35) {
                                              return "Pas plus de 50 caractères";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            helperStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                            helperText: "valeure actuelle: " +
                                                _resultatDaysList[
                                                        widget.indexResultDays]
                                                    .nombreVenteOffreDays
                                                    .toString(),
                                            labelStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 2.0,
                                                    color: Colors.blueAccent),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1.0,
                                                    color: Colors.blueAccent),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10),
                                            labelText:
                                                "Nombre de vente concernant l'offre" +
                                                    (index + 1).toString(),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),

                            offreVente(variable.getProduitGagnant(),
                                widget.indexProduct),
                            Center(
                              child: IconButton(
                                iconSize: 60,
                                alignment: Alignment.topRight,
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    {
                                      Provider.of<Challengecontroller>(context,
                                              listen: false)
                                          .editResultatDays(
                                        indexProduct: widget.indexProduct,
                                        chiffreAffaireDays: chiffreAffaire(
                                            offreEnCours: offreDays,
                                            venteOffre: nombreVenteOffreDays),
                                        facebookDepenseDays:
                                            facebookDepenseDays,
                                        panierDays: panierDays,
                                        vueDays: vueDays,
                                        venteDays: totalNombreVante(
                                            offreEnCours: offreDays,
                                            venteOffre: nombreVenteOffreDays),
                                        margeDays: margeDaysCalcul(
                                            coutPub: facebookDepenseDays,
                                            offreEnCours: offreDays,
                                            venteOffre: nombreVenteOffreDays),
                                        nombreVenteOffreDays:
                                            nombreVenteOffreDays,
                                        coutDaysProduit: coutProductDaysCalcul(
                                            offreEnCours: offreDays,
                                            venteOffre: nombreVenteOffreDays),
                                        prixShippingDays: shippingDaysCalcul(
                                            offreEnCours: offreDays,
                                            venteOffre: nombreVenteOffreDays),
                                        roaDays: roaDaysCalcul(
                                            offreEnCours: offreDays,
                                            venteOffre: nombreVenteOffreDays),
                                        indexResultDays: widget.indexResultDays,
                                      );

                                      Navigator.pop(context);
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
