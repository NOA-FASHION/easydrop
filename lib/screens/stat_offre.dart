import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StatOffre extends StatefulWidget {
  final Offre offres;
  StatOffre({required this.offres, Key? key}) : super(key: key);

  @override
  _StatOffreState createState() => _StatOffreState();
}

class _StatOffreState extends State<StatOffre> {
  Widget maxLetter(String word) {
    Widget longLetter;

    String word2;

    if (word.length >= 50) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.9,
        color: Colors.transparent,
        child: MarqueeText(
          text: word,
          style: TextStyle(
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else {
      word2 = word;
      longLetter = Text(word2);
    }
    return longLetter;
  }

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            title: Text("offre"),
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                      ),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 20.0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.13,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white70),
                                        borderRadius: BorderRadius.circular(10),
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
                                                      "Offre ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                    SizedBox(
                                                      width: 75.0,
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
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 15.0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.13,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: maxLetter(widget.offres.offres),
                                  ),
                                ),
                              )
                            ],
                          ))),
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
                                            Icon(
                                              Icons.calculate,
                                              size: 40,
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
                                                  child: Text("Prix d'achat"),
                                                )),
                                            Card(
                                                color: Colors.orange,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(widget
                                                          .offres.prixAchat
                                                          .toString() +
                                                      "€"),
                                                ))
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
                                              size: 40,
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
                                                  child: Text("Prix de vente"),
                                                )),
                                            Card(
                                                color: Colors.orange,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(widget
                                                          .offres.prixVente
                                                          .toString() +
                                                      "€"),
                                                ))
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
                                            Icon(
                                              Icons.calculate,
                                              size: 40,
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
                                                  child: Text("Prix barré"),
                                                )),
                                            Card(
                                                color: Colors.orange,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(widget
                                                          .offres.prixBarre
                                                          .toString() +
                                                      "€"),
                                                ))
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
                                              size: 40,
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
                                                  child: Text("Prix shipping"),
                                                )),
                                            Card(
                                                color: Colors.orange,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(widget
                                                          .offres.prixShipping
                                                          .toString() +
                                                      "€"),
                                                ))
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
                                                              .offres.margeOffre
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
                                                          ((widget.offres.margeOffre /
                                                                      widget
                                                                          .offres
                                                                          .prixVente) *
                                                                  100)
                                                              .roundToDouble(),
                                                          (((widget.offres.prixVente -
                                                                          widget
                                                                              .offres
                                                                              .margeOffre) /
                                                                      widget
                                                                          .offres
                                                                          .prixVente) *
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
                                                    Text(
                                                      "Roas: " +
                                                          widget.offres.roas
                                                              .toStringAsFixed(
                                                                  2) +
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
                                                          (((100 - widget.offres.roas) /
                                                                      1.80) *
                                                                  100)
                                                              .roundToDouble(),
                                                          (((widget.offres.roas) /
                                                                      1.80) *
                                                                  100)
                                                              .roundToDouble()
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
                ],
              ),
            )),
      ),
    );
  }
}
