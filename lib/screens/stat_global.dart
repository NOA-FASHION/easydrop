import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StatGlobal extends StatefulWidget {
  StatGlobal({Key? key}) : super(key: key);

  @override
  _StatGlobalState createState() => _StatGlobalState();
}

class _StatGlobalState extends State<StatGlobal> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Color> listeColors = [];

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
                                                'Couts produit: ',
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
                                                'Pub: ',
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
                                                'Shipping: ',
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
                                                'Marge: ',
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
                                            values: [25, 25, 25, 25],
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
                                                  values: [25, 75],
                                                  labels: ['test', 'test'],
                                                  sliceFillColors: [
                                                    Colors.amberAccent,
                                                    Colors.white
                                                  ],
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
                                                        color:
                                                            Colors.cyanAccent,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      'offre ',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  "Nombre de vues site internet :",
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
                                                      "Panier : ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: PieChart(
                                                    textScaleFactor: 0.0,
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
                                                    values: [50, 50],
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
                                                      "vente : ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: PieChart(
                                                    textScaleFactor: 0.0,
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
                                                    values: [25, 75],
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
                                                      "Marge: ",
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
                                                        values: [50, 50],
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
