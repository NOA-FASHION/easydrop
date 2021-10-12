import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StatDays extends StatefulWidget {
  final ResultJournee resultatDaysList;
  StatDays({required this.resultatDaysList});

  @override
  _StatDaysState createState() => _StatDaysState();
}

class _StatDaysState extends State<StatDays> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<double> statOffre(double totalOffres) {
      List<double> statOffres = [];

      for (var i = widget.resultatDaysList.nombreVenteOffreDays.length - 1;
          i >= 0;
          i--) {
        statOffres.add(
            (((double.parse(widget.resultatDaysList.nombreVenteOffreDays[i])) /
                        totalOffres) *
                    100)
                .roundToDouble());
      }
      return statOffres;
    }

    double totalOffre() {
      double totalOffres = 0;
      for (var i = widget.resultatDaysList.nombreVenteOffreDays.length - 1;
          i >= 0;
          i--) {
        totalOffres = totalOffres +
            (double.parse(widget.resultatDaysList.nombreVenteOffreDays[i]));
      }
      return totalOffres;
    }

    List<String> statOffreString() {
      List<String> statOffres = [];
      for (var i = widget.resultatDaysList.nombreVenteOffreDays.length - 1;
          i >= 0;
          i--) {
        statOffres.add('OFFRE :' + i.toString());
      }
      return statOffres;
    }

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
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70),
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
                                  children: [
                                    Container(
                                      height: 30.0,
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Text(
                                              "Résultat de la journée"
                                                  .toUpperCase(),
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
                    /////////////////////////////////////////////////////////////
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
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
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
                                                  Container(
                                                    height: 30.0,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Chiffre d'affaire",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        SizedBox(
                                                          width: 75.0,
                                                        ),
                                                        Text(
                                                          widget
                                                              .resultatDaysList
                                                              .chiffreAffaireDays
                                                              .roundToDouble()
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: PieChart(
                                      size: Size.infinite,
                                      legendIconSize: 5,
                                      legendItemPadding: EdgeInsets.all(0),
                                      legendIconShape: LegendIconShape.Square,
                                      legendPosition: LegendPosition.Right,
                                      legendTextSize: 7,
                                      textScaleFactor: 0.05,
                                      // maxWidth:
                                      //     MediaQuery.of(context).size.width /
                                      //         2.9,
                                      // maxHeight:
                                      //     MediaQuery.of(context).size.height /
                                      //         12,
                                      values: [
                                        (((widget.resultatDaysList
                                                        .coutDaysProduit /
                                                    widget.resultatDaysList
                                                        .chiffreAffaireDays) *
                                                100))
                                            .roundToDouble(),
                                        (((widget.resultatDaysList
                                                        .facebookDepenseDays /
                                                    widget.resultatDaysList
                                                        .chiffreAffaireDays) *
                                                100))
                                            .roundToDouble(),
                                        (((widget.resultatDaysList
                                                        .prixShippingDays /
                                                    widget.resultatDaysList
                                                        .chiffreAffaireDays) *
                                                100))
                                            .roundToDouble(),
                                        (((widget.resultatDaysList.margeDays /
                                                    widget.resultatDaysList
                                                        .chiffreAffaireDays) *
                                                100))
                                            .roundToDouble()
                                      ],
                                      labels: [
                                        'Couts produit: ' +
                                            widget.resultatDaysList
                                                .coutDaysProduit
                                                .roundToDouble()
                                                .toString(),
                                        'Pub: ' +
                                            widget.resultatDaysList
                                                .facebookDepenseDays
                                                .roundToDouble()
                                                .toString(),
                                        'Shipping: ' +
                                            widget.resultatDaysList
                                                .prixShippingDays
                                                .roundToDouble()
                                                .toString(),
                                        'Marge: ' +
                                            widget.resultatDaysList.margeDays
                                                .roundToDouble()
                                                .toString()
                                      ],
                                      sliceFillColors: [
                                        Colors.blueAccent,
                                        Colors.orangeAccent,
                                        Colors.cyanAccent,
                                        Colors.lightGreenAccent
                                      ],
                                      animationDuration:
                                          Duration(milliseconds: 1500),
                                      showLegend: true,
                                    ),
                                    height: 220.0,
                                  ),
                                ),
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
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
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
                                                  Container(
                                                    height: 30.0,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Nombre d'offre: ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        SizedBox(
                                                          width: 75.0,
                                                        ),
                                                        Text(
                                                          widget
                                                              .resultatDaysList
                                                              .nombreVenteOffreDays
                                                              .length
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.65,
                                                      child: PieChart(
                                                        legendItemPadding:
                                                            EdgeInsets.all(2),
                                                        legendIconShape:
                                                            LegendIconShape
                                                                .Square,
                                                        legendPosition:
                                                            LegendPosition
                                                                .Right,
                                                        legendTextSize: 7,
                                                        textScaleFactor: 0.1,
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.8,
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                10,
                                                        values: statOffre(
                                                            totalOffre()),
                                                        labels:
                                                            statOffreString(),
                                                        sliceFillColors: [
                                                          Colors.blueAccent,
                                                          Colors.orangeAccent
                                                        ],
                                                        animationDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    1500),
                                                        showLegend: true,
                                                      ),
                                                      height: 140.0,
                                                    ),
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
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
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
                                              Container(
                                                height: 30.0,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Nombre de vues site internet :" +
                                                          widget
                                                              .resultatDaysList
                                                              .vueDays
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
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
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
                                                  Text(
                                                    "Nombre de panier :" +
                                                        widget.resultatDaysList
                                                            .panierDays
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue),
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
                                                        ((widget.resultatDaysList
                                                                        .panierDays /
                                                                    widget
                                                                        .resultatDaysList
                                                                        .vueDays) *
                                                                100)
                                                            .roundToDouble(),
                                                        (((widget.resultatDaysList
                                                                            .vueDays -
                                                                        widget
                                                                            .resultatDaysList
                                                                            .panierDays) /
                                                                    widget
                                                                        .resultatDaysList
                                                                        .vueDays) *
                                                                100)
                                                            .roundToDouble()
                                                      ],
                                                      labels: [
                                                        'panier',
                                                        'nonpanier'
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
                                              Column(
                                                children: [
                                                  Text(
                                                    "Nombre de vente :" +
                                                        widget.resultatDaysList
                                                            .venteDays
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue),
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
                                                        ((widget.resultatDaysList
                                                                        .venteDays /
                                                                    widget
                                                                        .resultatDaysList
                                                                        .vueDays) *
                                                                100)
                                                            .roundToDouble(),
                                                        (((widget.resultatDaysList
                                                                            .vueDays -
                                                                        widget
                                                                            .resultatDaysList
                                                                            .venteDays) /
                                                                    widget
                                                                        .resultatDaysList
                                                                        .vueDays) *
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                elevation: 20.0,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
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
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 15.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 30.0,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "MARGE: " +
                                                              widget
                                                                  .resultatDaysList
                                                                  .margeDays
                                                                  .roundToDouble()
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
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
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 15.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                            ((widget.resultatDaysList
                                                                            .margeDays /
                                                                        widget
                                                                            .resultatDaysList
                                                                            .chiffreAffaireDays) *
                                                                    100)
                                                                .roundToDouble(),
                                                            100 -
                                                                ((widget.resultatDaysList.margeDays /
                                                                            widget.resultatDaysList.chiffreAffaireDays) *
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
                                elevation: 20.0,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
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
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 15.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 30.0,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "ROAS",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
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
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 15.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
