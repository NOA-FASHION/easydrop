import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StatOffre extends StatefulWidget {
  StatOffre({Key? key}) : super(key: key);

  @override
  _StatOffreState createState() => _StatOffreState();
}

class _StatOffreState extends State<StatOffre> {
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.13,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white70),
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Un acheté le deuxieme offert'),
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
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white70),
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.pink, Colors.orange])),
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15.0,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.calculate,
                                        size: 40,
                                        color: Colors.orange[900],
                                      ),
                                      Container(
                                        child: Card(
                                            color: Colors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            elevation: 10.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Prix d'achat"),
                                            )),
                                      ),
                                      Card(
                                          color: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('120'),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white70),
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.pink, Colors.orange])),
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15.0,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.calculate,
                                        size: 40,
                                        color: Colors.orange[900],
                                      ),
                                      Container(
                                        child: Card(
                                            color: Colors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            elevation: 10.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Prix d'achat"),
                                            )),
                                      ),
                                      Card(
                                          color: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('120'),
                                          ))
                                    ],
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
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white70),
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.pink, Colors.orange])),
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15.0,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.calculate,
                                        size: 40,
                                        color: Colors.orange[900],
                                      ),
                                      Container(
                                        child: Card(
                                            color: Colors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            elevation: 10.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Prix d'achat"),
                                            )),
                                      ),
                                      Card(
                                          color: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('120'),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white70),
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.pink, Colors.orange])),
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: Card(
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 15.0,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.calculate,
                                        size: 40,
                                        color: Colors.orange[900],
                                      ),
                                      Container(
                                        child: Card(
                                            color: Colors.amber,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            elevation: 10.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("Prix d'achat"),
                                            )),
                                      ),
                                      Card(
                                          color: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('120'),
                                          ))
                                    ],
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
                                      width: MediaQuery.of(context).size.width /
                                          2.7,
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
                                                      color: Colors.greenAccent,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    "Marge: " + "€",
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
                                      width: MediaQuery.of(context).size.width /
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    child: PieChart(
                                                      textScaleFactor: 0.0,
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.3,
                                                      maxHeight:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              14,
                                                      values: [10, 25],
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
                                      width: MediaQuery.of(context).size.width /
                                          2.7,
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
                                      width: MediaQuery.of(context).size.width /
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    child: PieChart(
                                                      textScaleFactor: 0.0,
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.3,
                                                      maxHeight:
                                                          MediaQuery.of(context)
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
              ],
            )),
      ),
    );
  }
}
