import 'dart:io';

import 'package:currency_textfield/currency_textfield.dart';
import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:easydrop/screens/build_result_days.dart';
import 'package:easydrop/screens/offre.dart';
import 'package:easydrop/screens/stat_global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ResultDays extends StatefulWidget {
  final int indexProduct;
  final String idProduct;
  ResultDays(this.indexProduct, this.idProduct);

  @override
  _ResultDaysState createState() => _ResultDaysState();
}

class _ResultDaysState extends State<ResultDays> {
  late PersistentBottomSheetController _bottomSheetController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  var controller = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");

  // late FancyDrawerController _controller;
  void initState() {
    super.initState();

    // _controller =
    //     FancyDrawerController(vsync: this, duration: Duration(milliseconds: 50))
    //       ..addListener(() {
    //         setState(() {}); // Must call setState
    //       }); // This chunk of code is important
  }

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

  @override
  Widget build(BuildContext context) {
    Challengecontroller variable = Provider.of<Challengecontroller>(context);
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: SafeArea(
            child: AppBar(
              title: Text("Résultats de la journée",
                  style: TextStyle(color: Colors.black)),
              centerTitle: true,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: ChangeNotifierProvider.value(
                                        value: variable,
                                        child: OffreProduct(widget.indexProduct,
                                            widget.idProduct))));

                            // Navigator.of(context).push(PageTransition(
                            //     type: PageTransitionType.bottomToTop,
                            //     child: OffreProduct(
                            //         widget.indexProduct, widget.idProduct)));
                          }, // butt
                          child: Icon(
                            Icons.fact_check_outlined,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ), // icon
                        Text(
                          "Offres",
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ), // text
                      ],
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 140,
                      height: 140,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: ChangeNotifierProvider.value(
                                        value: variable,
                                        child: StatGlobal(
                                            idProduct: widget.idProduct,
                                            indexProduct:
                                                widget.indexProduct))));
                          },
                          child: Icon(
                            Icons.query_stats,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ), // icon
                        Text(
                          "Stats globales",
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ), // text
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.orange, Colors.pink])),
              ),
            ),
          ),
        ),
        body: Shimmer(
          duration: Duration(seconds: 3),
          interval: Duration(seconds: 5),
          color: Colors.white,
          enabled: true,
          direction: ShimmerDirection.fromLTRB(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.orange, Colors.pink])),
            child: BuildResultDays(widget.idProduct, widget.indexProduct),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: buildBottomSheet(),
      ),
    );
  }

  updateController(dynamic value) {
    _bottomSheetController.setState!(() {
      var unityChallenge = value;
    });
  }

  FloatingActionButton buildBottomSheet() {
    DateTime today = new DateTime.now();
    String todays = DateFormat('EEEE, d MMM, yyyy').format(today);
    Challengecontroller variable = Provider.of<Challengecontroller>(context);
    List<Offre> offreDays = variable.getOffresProduct(widget.idProduct);
    return FloatingActionButton(
        // child: Lottie.asset('assets/float.json'),
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        onPressed: () {
          _bottomSheetController = scaffoldkey.currentState!.showBottomSheet(
            (context) {
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 1.5,
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
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
                                        .getProduitGagnant()[
                                            widget.indexProduct]
                                        .photoProduit),
                                    width:
                                        MediaQuery.of(context).size.width / 5,
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
                                      if (value!.isEmpty) {
                                        return "Merci d'entrer les dépense facebook";
                                      } else if (value.length > 35) {
                                        return "Pas plus de 50 caractères";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
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
                                      labelText:
                                          "Nombre de panier de la journée",
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
                                      if (value!.isEmpty) {
                                        return "Merci d'entrer le nombre de vue de la journée";
                                      } else if (value.length > 35) {
                                        return "Pas plus de 50 caractères";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
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
                                      labelText:
                                          "le nombre de vue de la journée",
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
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                              if (value!.isEmpty) {
                                                return "Merci d'entrer le nombre de vente concernant l'offre " +
                                                    offreDays.length.toString();
                                              } else if (value.length > 35) {
                                                return "Pas plus de 50 caractères";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
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
                                        Provider.of<Challengecontroller>(
                                                context,
                                                listen: false)
                                            .addResultatDays(
                                          date: todays,
                                          index: widget.indexProduct,
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
                                          coutDaysProduit:
                                              coutProductDaysCalcul(
                                                  offreEnCours: offreDays,
                                                  venteOffre:
                                                      nombreVenteOffreDays),
                                          prixShippingDays: shippingDaysCalcul(
                                              offreEnCours: offreDays,
                                              venteOffre: nombreVenteOffreDays),
                                          roaDays: roaDaysCalcul(
                                              offreEnCours: offreDays,
                                              venteOffre: nombreVenteOffreDays),
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
                  ));
            },
          );
        });
  }
}
