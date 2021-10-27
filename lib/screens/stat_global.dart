import 'dart:math';

import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class StatGlobal extends StatefulWidget {
  final int indexProduct;

  final String idProduct;
  StatGlobal({required this.idProduct, required this.indexProduct, Key? key})
      : super(key: key);

  @override
  _StatGlobalState createState() => _StatGlobalState();
}

class _StatGlobalState extends State<StatGlobal> {
  List<Color> listeColors = [];
  void _launchMapsUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<double> statOffre(double totalOffres, ProduitGagnant produitGagnant) {
    List<double> statOffres = [];

    for (var i = produitGagnant.nombreVenteOffreTotal.length - 1; i >= 0; i--) {
      statOffres.add((((double.parse(produitGagnant.nombreVenteOffreTotal[i])) /
                  totalOffres) *
              100)
          .roundToDouble());
    }
    return statOffres;
  }

  List<Color> listeDeCouleurOffre(ProduitGagnant produitGagnant) {
    List<Color> listesColor = [];
    for (var i = produitGagnant.nombreVenteOffreTotal.length - 1; i >= 0; i--) {
      listesColor
          .add(Colors.primaries[Random().nextInt(Colors.primaries.length)]);
    }
    listeColors = listesColor;

    return listesColor;
  }

  double totalOffre(ProduitGagnant produitGagnant) {
    double totalOffres = 0;
    for (var i = produitGagnant.nombreVenteOffreTotal.length - 1; i >= 0; i--) {
      totalOffres =
          totalOffres + (double.parse(produitGagnant.nombreVenteOffreTotal[i]));
    }
    return totalOffres;
  }

  List<String> statOffreString(ProduitGagnant produitGagnant) {
    List<String> statOffres = [];
    for (var i = produitGagnant.nombreVenteOffreTotal.length - 1; i >= 0; i--) {
      statOffres.add('OFFRE ' +
          (i + 1).toString() +
          " : " +
          produitGagnant.nombreVenteOffreTotal[i]);
    }
    return statOffres;
  }

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Challengecontroller variable = Provider.of<Challengecontroller>(context);
    List<ProduitGagnant> _productGagnantList = variable.getProduitGagnant();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            title: Text("Produit"),
            centerTitle: true,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 40.0),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logo.png',
                width: 55,
                height: 130,
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
      key: scaffoldkey,
      body: Shimmer(
        duration: Duration(seconds: 3),
        interval: Duration(seconds: 5),
        color: Colors.white,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.orange, Colors.pink])),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.pink, Colors.orange])),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 15.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30.0,
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Text(
                                            "Résultat total".toUpperCase(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.08,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 15.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white70),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.pink,
                                                Colors.orange
                                              ])),
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      child: Card(
                                        color: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 15.0,
                                        child: Column(
                                          children: [
                                            IconButton(
                                              iconSize: 50,
                                              color: Colors.orange[900],
                                              icon: Icon(Icons.web),
                                              onPressed: () {
                                                _launchMapsUrl(
                                                    _productGagnantList[
                                                            widget.indexProduct]
                                                        .siteVente);
                                              },
                                            ),
                                            Card(
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                elevation: 10.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("Site internet"),
                                                )),
                                            // Card(
                                            //     color: Colors.orange,
                                            //     shape: RoundedRectangleBorder(
                                            //       borderRadius:
                                            //           BorderRadius.circular(
                                            //               7.0),
                                            //     ),
                                            //     child: Padding(
                                            //       padding:
                                            //           const EdgeInsets.all(8.0),
                                            //       child: Text("€"),
                                            //     ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white70),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.pink,
                                                Colors.orange
                                              ])),
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      child: Card(
                                        color: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 15.0,
                                        child: Column(
                                          children: [
                                            IconButton(
                                              iconSize: 50,
                                              color: Colors.orange[900],
                                              icon: Icon(Icons.facebook),
                                              onPressed: () {
                                                _launchMapsUrl(
                                                    _productGagnantList[
                                                            widget.indexProduct]
                                                        .facebookAdress);
                                              },
                                            ),
                                            Card(
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                elevation: 10.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("Facebook"),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white70),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.pink,
                                                Colors.orange
                                              ])),
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      child: Card(
                                        color: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 15.0,
                                        child: Column(
                                          children: [
                                            IconButton(
                                              iconSize: 50,
                                              color: Colors.orange[900],
                                              icon: Icon(Icons.shop),
                                              onPressed: () {
                                                _launchMapsUrl(
                                                    _productGagnantList[
                                                            widget.indexProduct]
                                                        .siteAliexpress);
                                              },
                                            ),
                                            Card(
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                elevation: 10.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("Aliexpress"),
                                                )),
                                            // Card(
                                            //     color: Colors.orange,
                                            //     shape: RoundedRectangleBorder(
                                            //       borderRadius:
                                            //           BorderRadius.circular(
                                            //               7.0),
                                            //     ),
                                            //     child: Padding(
                                            //       padding:
                                            //           const EdgeInsets.all(8.0),
                                            //       child: Text("€"),
                                            //     ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white70),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.pink,
                                                Colors.orange
                                              ])),
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      child: Card(
                                        color: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        elevation: 15.0,
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.calculate,
                                              size: 50,
                                              color: Colors.orange[900],
                                            ),
                                            Card(
                                                color: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                elevation: 10.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("Produit"),
                                                )),
                                            // Card(
                                            //     color: Colors.orange,
                                            //     shape: RoundedRectangleBorder(
                                            //       borderRadius:
                                            //           BorderRadius.circular(
                                            //               7.0),
                                            //     ),
                                            //     child: Padding(
                                            //       padding:
                                            //           const EdgeInsets.all(8.0),
                                            //       child: Text("€"),
                                            //     ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /////////////////////////////////////////////////////////////
                  Container(
                      width: MediaQuery.of(context).size.width / 1.13,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 45.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              3.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 20.0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white70),
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.pink,
                                              Colors.orange
                                            ])),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 30.0,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 25.0,
                                                    ),
                                                    Text(
                                                      "Chiffre d'affaire",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                    SizedBox(
                                                      width: 25.0,
                                                    ),
                                                    Text(
                                                      variable
                                                              .chiffreDaffaireTotal(
                                                                  widget
                                                                      .indexProduct)
                                                              .roundToDouble()
                                                              .toString() +
                                                          "€",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 15.0,
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10.0,
                                                width: 10.0,
                                                decoration: new BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Couts produit: ' +
                                                    variable
                                                        .coutProductTotal(
                                                            widget.indexProduct)
                                                        .roundToDouble()
                                                        .toString() +
                                                    "€",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueAccent),
                                              ),
                                              SizedBox(
                                                width: 30.0,
                                              ),
                                              Container(
                                                height: 10.0,
                                                width: 10.0,
                                                decoration: new BoxDecoration(
                                                  color: Colors.orangeAccent,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Pub: ' +
                                                    variable
                                                        .pubTotal(
                                                            widget.indexProduct)
                                                        .roundToDouble()
                                                        .toString() +
                                                    "€",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orangeAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10.0,
                                                width: 10.0,
                                                decoration: new BoxDecoration(
                                                  color: Colors.cyanAccent,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Shipping: ' +
                                                    variable
                                                        .shippingTotal(
                                                            widget.indexProduct)
                                                        .roundToDouble()
                                                        .toString() +
                                                    "€",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.cyanAccent,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 52.0,
                                              ),
                                              Container(
                                                height: 10.0,
                                                width: 10.0,
                                                decoration: new BoxDecoration(
                                                  color:
                                                      Colors.lightGreenAccent,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Marge: ' +
                                                    variable
                                                        .margeTotal(
                                                            widget.indexProduct)
                                                        .roundToDouble()
                                                        .toString() +
                                                    "€",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .lightGreenAccent),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          child: PieChart(
                                            size: Size.fromWidth(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.1),
                                            legendIconSize: 3,
                                            legendItemPadding:
                                                EdgeInsets.all(0),
                                            legendIconShape:
                                                LegendIconShape.Square,
                                            legendPosition:
                                                LegendPosition.Bottom,
                                            legendTextSize: 8,
                                            textScaleFactor: 0.00,
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.9,
                                            maxHeight: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                12,
                                            values: [
                                              (((variable.coutProductTotal(
                                                      widget.indexProduct) /
                                                  variable.chiffreAffaireTotal(
                                                      widget.indexProduct) *
                                                  100))),
                                              (((variable.pubTotal(
                                                      widget.indexProduct) /
                                                  variable.chiffreAffaireTotal(
                                                      widget.indexProduct) *
                                                  100))),
                                              (((variable.shippingTotal(
                                                      widget.indexProduct) /
                                                  variable.chiffreAffaireTotal(
                                                      widget.indexProduct) *
                                                  100))),
                                              (((variable.margeTotal(
                                                          widget.indexProduct) /
                                                      variable.chiffreAffaireTotal(
                                                          widget
                                                              .indexProduct)) *
                                                  100))
                                            ],
                                            labels: [
                                              'Couts produit: ',
                                              'Pub: ',
                                              'Shipping: ',
                                              'Marge: '
                                            ],
                                            sliceFillColors: [
                                              Colors.blueAccent,
                                              Colors.orangeAccent,
                                              Colors.cyanAccent,
                                              Colors.lightGreenAccent
                                            ],
                                            animationDuration:
                                                Duration(milliseconds: 1500),
                                            showLegend: false,
                                          ),
                                          height: 210.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ))),
                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 45.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              3.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 20.0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white70),
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.pink,
                                              Colors.orange
                                            ])),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 30.0,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 25.0,
                                                    ),
                                                    Text(
                                                      "Nombre total de vente par offres ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                    SizedBox(
                                                      width: 35.0,
                                                    ),
                                                    // Text(
                                                    //   widget
                                                    //       .resultatDaysList
                                                    //       .nombreVenteOffreDays
                                                    //       .length
                                                    //       .toString(),
                                                    //   style: TextStyle(
                                                    //       fontWeight:
                                                    //           FontWeight
                                                    //               .bold,
                                                    //       color:
                                                    //           Colors.blue),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //         Border.all(color: Colors.white70),
                                    //     borderRadius: BorderRadius.circular(15),
                                    //     gradient: LinearGradient(
                                    //         begin: Alignment.centerLeft,
                                    //         end: Alignment.centerRight,
                                    //         colors: [
                                    //           Colors.pink,
                                    //           Colors.orange
                                    //         ])),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 15.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.15,
                                                child: PieChart(
                                                  legendIconSize: 5,
                                                  legendItemPadding:
                                                      EdgeInsets.all(2),
                                                  legendIconShape:
                                                      LegendIconShape.Circle,
                                                  legendPosition:
                                                      LegendPosition.Top,
                                                  legendTextSize: 7,
                                                  textScaleFactor: 0.00,
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1.8,
                                                  maxHeight:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height /
                                                          10,
                                                  values: statOffre(
                                                      totalOffre(
                                                          _productGagnantList[
                                                              widget
                                                                  .indexProduct]),
                                                      _productGagnantList[
                                                          widget.indexProduct]),
                                                  labels: statOffreString(
                                                      _productGagnantList[
                                                          widget.indexProduct]),
                                                  sliceFillColors:
                                                      listeDeCouleurOffre(
                                                          _productGagnantList[
                                                              widget
                                                                  .indexProduct]),
                                                  animationDuration: Duration(
                                                      milliseconds: 1500),
                                                  showLegend: false,
                                                ),
                                                height: 220.0,
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 200,
                                              child: ListView.builder(
                                                  itemCount:
                                                      _productGagnantList[widget
                                                              .indexProduct]
                                                          .nombreVenteOffreTotal
                                                          .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Row(
                                                      children: [
                                                        Container(
                                                          height: 10.0,
                                                          width: 10.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: listeColors[
                                                                index],
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text(
                                                          'offre ' +
                                                              (index + 1)
                                                                  .toString() +
                                                              ": " +
                                                              _productGagnantList[
                                                                      widget
                                                                          .indexProduct]
                                                                  .nombreVenteOffreTotal[index],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: listeColors[
                                                                index],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ))),
                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ///   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 45.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              3.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 20.0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white70),
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.pink,
                                              Colors.orange
                                            ])),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30.0,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 25.0,
                                                ),
                                                Container(
                                                  height: 10.0,
                                                  width: 10.0,
                                                  decoration: new BoxDecoration(
                                                    color: Colors.blue,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  "Nombre de vues site internet :" +
                                                      variable
                                                          .nombreVueTotal(widget
                                                              .indexProduct)
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //         Border.all(color: Colors.white70),
                                    //     borderRadius: BorderRadius.circular(15),
                                    //     gradient: LinearGradient(
                                    //         begin: Alignment.centerLeft,
                                    //         end: Alignment.centerRight,
                                    //         colors: [
                                    //           Colors.pink,
                                    //           Colors.orange
                                    //         ])),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 15.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 10.0,
                                                      width: 10.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: Colors
                                                            .lightGreenAccent,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      "Panier : " +
                                                          variable
                                                              .nombrePanierTotal(
                                                                  widget
                                                                      .indexProduct)
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: PieChart(
                                                    textScaleFactor: 0.1,
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    maxHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            14,
                                                    values: [
                                                      ((variable.nombrePanierTotal(
                                                                      widget
                                                                          .indexProduct) /
                                                                  variable.nombreVueTotal(
                                                                      widget
                                                                          .indexProduct)) *
                                                              100)
                                                          .roundToDouble(),
                                                      (((variable.nombreVueTotal(
                                                                          widget
                                                                              .indexProduct) -
                                                                      variable.nombrePanierTotal(
                                                                          widget
                                                                              .indexProduct)) /
                                                                  variable.nombreVueTotal(
                                                                      widget
                                                                          .indexProduct)) *
                                                              100)
                                                          .roundToDouble(),
                                                    ],
                                                    labels: [
                                                      'panier',
                                                      'nonpanier'
                                                    ],
                                                    sliceFillColors: [
                                                      Colors.lightGreenAccent,
                                                      Colors.blue
                                                    ],
                                                    animationDuration: Duration(
                                                        milliseconds: 1500),
                                                    showLegend: false,
                                                  ),
                                                  height: 140.0,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 10.0,
                                                      width: 10.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color:
                                                            Colors.amberAccent,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      "vente : " +
                                                          variable
                                                              .nombreVenteTotal(
                                                                  widget
                                                                      .indexProduct)
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: PieChart(
                                                    textScaleFactor: 0.1,
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    maxHeight:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            14,
                                                    values: [
                                                      ((variable.nombreVenteTotal(
                                                                      widget
                                                                          .indexProduct) /
                                                                  variable.nombreVueTotal(
                                                                      widget
                                                                          .indexProduct)) *
                                                              100)
                                                          .roundToDouble(),
                                                      (((variable.nombreVueTotal(
                                                                          widget
                                                                              .indexProduct) -
                                                                      variable.nombreVenteTotal(
                                                                          widget
                                                                              .indexProduct)) /
                                                                  variable.nombreVueTotal(
                                                                      widget
                                                                          .indexProduct)) *
                                                              100)
                                                          .roundToDouble(),
                                                    ],
                                                    labels: ['Marge', 'frais'],
                                                    sliceFillColors: [
                                                      Colors.amberAccent,
                                                      Colors.blue
                                                    ],
                                                    animationDuration: Duration(
                                                        milliseconds: 1500),
                                                    showLegend: false,
                                                  ),
                                                  height: 140.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ))),
                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ///   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 45.0, // soften the shadow
                                spreadRadius: 2.0, //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.7,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white70),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Colors.pink,
                                                  Colors.orange
                                                ])),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30.0,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 10.0,
                                                      width: 10.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color:
                                                            Colors.greenAccent,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      'Marge: ' +
                                                          variable
                                                              .margeTotal(widget
                                                                  .indexProduct)
                                                              .roundToDouble()
                                                              .toString() +
                                                          "€",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.7,
                                        // decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //         color: Colors.white70),
                                        //     borderRadius:
                                        //         BorderRadius.circular(15),
                                        //     gradient: LinearGradient(
                                        //         begin: Alignment.centerLeft,
                                        //         end: Alignment.centerRight,
                                        //         colors: [
                                        //           Colors.pink,
                                        //           Colors.orange
                                        //         ])),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          elevation: 15.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      child: PieChart(
                                                        textScaleFactor: 0.1,
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3.3,
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                14,
                                                        values: [
                                                          ((variable.margeTotal(
                                                                          widget
                                                                              .indexProduct) /
                                                                      variable.chiffreAffaireTotal(
                                                                          widget
                                                                              .indexProduct)) *
                                                                  100)
                                                              .roundToDouble(),
                                                          100 -
                                                              (((variable.margeTotal(widget
                                                                              .indexProduct) /
                                                                          variable
                                                                              .chiffreAffaireTotal(widget.indexProduct))) *
                                                                      100)
                                                                  .roundToDouble()
                                                        ],
                                                        labels: [
                                                          'Marge',
                                                          'frais'
                                                        ],
                                                        sliceFillColors: [
                                                          Colors.greenAccent,
                                                          Colors.red
                                                        ],
                                                        animationDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    1500),
                                                        showLegend: false,
                                                      ),
                                                      height: 140.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ))),
                      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      //////   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 45.0, // soften the shadow
                                spreadRadius: 2.0, //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 10  horizontally
                                  3.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.7,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white70),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Colors.pink,
                                                  Colors.orange
                                                ])),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30.0,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Roas",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.7,
                                        // decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //         color: Colors.white70),
                                        //     borderRadius:
                                        //         BorderRadius.circular(15),
                                        //     gradient: LinearGradient(
                                        //         begin: Alignment.centerLeft,
                                        //         end: Alignment.centerRight,
                                        //         colors: [
                                        //           Colors.pink,
                                        //           Colors.orange
                                        //         ])),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          elevation: 15.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      child: PieChart(
                                                        textScaleFactor: 0.0,
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3.3,
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                14,
                                                        values: [40, 60],
                                                        labels: [
                                                          'Marge',
                                                          'frais'
                                                        ],
                                                        sliceFillColors: [
                                                          Colors.greenAccent,
                                                          Colors.red
                                                        ],
                                                        animationDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    1500),
                                                        showLegend: false,
                                                      ),
                                                      height: 140.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ))),
                      //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    ],
                  )
                ])),
          ),
        ),
      ),
    );
  }
}
