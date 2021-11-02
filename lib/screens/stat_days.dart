import 'dart:math';

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
    List<Color> listeColors = [];
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

    List<Color> listeDeCouleurOffre() {
      List<Color> listesColor = [];
      for (var i = widget.resultatDaysList.nombreVenteOffreDays.length - 1;
          i >= 0;
          i--) {
        listesColor
            .add(Colors.primaries[Random().nextInt(Colors.primaries.length)]);
      }
      listeColors = listesColor;

      return listesColor;
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
        statOffres.add('OFFRE ' +
            (i + 1).toString() +
            " : " +
            widget.resultatDaysList.nombreVenteOffreDays[i]);
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
                                            "statistique de la journée"
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
                  SizedBox(
                    height: 10,
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
                                                      width: 95.0,
                                                    ),
                                                    Text(
                                                      widget.resultatDaysList
                                                              .chiffreAffaireDays
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
                                                    widget.resultatDaysList
                                                        .coutDaysProduit
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
                                                    widget.resultatDaysList
                                                        .facebookDepenseDays
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
                                                    widget.resultatDaysList
                                                        .prixShippingDays
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
                                                    widget.resultatDaysList
                                                        .margeDays
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
                                              (((widget.resultatDaysList
                                                          .coutDaysProduit /
                                                      widget.resultatDaysList
                                                          .chiffreAffaireDays) *
                                                  100)),
                                              (((widget.resultatDaysList
                                                          .facebookDepenseDays /
                                                      widget.resultatDaysList
                                                          .chiffreAffaireDays) *
                                                  100)),
                                              (((widget.resultatDaysList
                                                          .prixShippingDays /
                                                      widget.resultatDaysList
                                                          .chiffreAffaireDays) *
                                                  100)),
                                              (((widget.resultatDaysList
                                                          .margeDays /
                                                      widget.resultatDaysList
                                                          .chiffreAffaireDays) *
                                                  100))
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
                                                  widget.resultatDaysList
                                                      .margeDays
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
                                                      "Nombre de vente par offres ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                    SizedBox(
                                                      width: 75.0,
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
                                                  values:
                                                      statOffre(totalOffre()),
                                                  labels: statOffreString(),
                                                  sliceFillColors:
                                                      listeDeCouleurOffre(),
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
                                                  itemCount: widget
                                                      .resultatDaysList
                                                      .nombreVenteOffreDays
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
                                                              widget.resultatDaysList
                                                                      .nombreVenteOffreDays[
                                                                  index],
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
                                                      widget.resultatDaysList
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
                                                          widget
                                                              .resultatDaysList
                                                              .panierDays
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
                                                          widget
                                                              .resultatDaysList
                                                              .venteDays
                                                              .toInt()
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
                                                      "Marge: " +
                                                          widget
                                                              .resultatDaysList
                                                              .margeDays
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
                                                          ((widget.resultatDaysList
                                                                          .margeDays /
                                                                      widget
                                                                          .resultatDaysList
                                                                          .chiffreAffaireDays) *
                                                                  100)
                                                              .roundToDouble(),
                                                          100 -
                                                              ((widget.resultatDaysList
                                                                              .margeDays /
                                                                          widget
                                                                              .resultatDaysList
                                                                              .chiffreAffaireDays) *
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
                                                      "Roas: " +
                                                          (widget.resultatDaysList
                                                                      .chiffreAffaireDays /
                                                                  widget
                                                                      .resultatDaysList
                                                                      .margeDays)
                                                              .toStringAsFixed(
                                                                  2),
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
                                                        values: [
                                                          (100 -
                                                              (((widget.resultatDaysList
                                                                              .chiffreAffaireDays /
                                                                          widget
                                                                              .resultatDaysList
                                                                              .margeDays) /
                                                                      1.80) *
                                                                  100)),
                                                          (((widget.resultatDaysList
                                                                          .chiffreAffaireDays /
                                                                      widget
                                                                          .resultatDaysList
                                                                          .margeDays) /
                                                                  1.80) *
                                                              100)
                                                        ],
                                                        labels: [
                                                          'Marge',
                                                          'frais'
                                                        ],
                                                        sliceFillColors: [
                                                          Colors
                                                              .lightGreenAccent,
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
