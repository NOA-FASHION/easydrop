import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:easydrop/screens/image_capture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class StatDays extends StatefulWidget {
  final ResultJournee resultatDaysList;
  final int indexProduct;
  final String idProduct;
  final int indexResultDays;
  StatDays(
      {required this.idProduct,
      required this.indexResultDays,
      required this.resultatDaysList,
      required this.indexProduct});

  @override
  _StatDaysState createState() => _StatDaysState();
}

class _StatDaysState extends State<StatDays> {
  final key = GlobalKey();
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Color> listeColors = [];
    List<String> dateTraduction(String date) {
      List<String> dateTraduct = date.split(",");

      if (dateTraduct[0] == "Monday") {
        dateTraduct[0] = 'Lumdi';
      } else if (dateTraduct[0] == "Tuesday") {
        dateTraduct[0] = 'Mardi';
      } else if (dateTraduct[0] == "Wednesday") {
        dateTraduct[0] = 'Mercredi';
      } else if (dateTraduct[0] == "Thursday") {
        dateTraduct[0] = 'Jeudi';
      } else if (dateTraduct[0] == "Friday") {
        dateTraduct[0] = 'Vendredi';
      } else if (dateTraduct[0] == "Saturday") {
        dateTraduct[0] = 'Samedi';
      } else if (dateTraduct[0] == "Sunday") {
        dateTraduct[0] = 'Dimanche';
      }

      return dateTraduct;
    }

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

    Challengecontroller variable = Provider.of<Challengecontroller>(context);
    List<ProduitGagnant> _productGagnantList = variable.getProduitGagnant();
    List<ResultJournee> _resultatDaysList =
        variable.getResulDays(widget.idProduct);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: SafeArea(
          child: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      splashColor: Colors.white,
                      onTap: () async {
                        final boundary3 = key3.currentContext
                            ?.findRenderObject() as RenderRepaintBoundary?;
                        final image3 = await boundary3?.toImage();
                        final byteData3 = await image3?.toByteData(
                            format: ImageByteFormat.png);
                        var imageBytes3 = byteData3?.buffer.asUint8List();

                        ////////////////////
                        final boundary2 = key2.currentContext
                            ?.findRenderObject() as RenderRepaintBoundary?;
                        final image2 = await boundary2?.toImage();
                        final byteData2 = await image2?.toByteData(
                            format: ImageByteFormat.png);
                        var imageBytes2 = byteData2?.buffer.asUint8List();

                        ////////////////////
                        final boundary1 = key1.currentContext
                            ?.findRenderObject() as RenderRepaintBoundary?;
                        final image1 = await boundary1?.toImage();
                        final byteData1 = await image1?.toByteData(
                            format: ImageByteFormat.png);
                        var imageBytes1 = byteData1?.buffer.asUint8List();

                        ////////////////////
                        final boundary = key.currentContext?.findRenderObject()
                            as RenderRepaintBoundary?;
                        final image = await boundary?.toImage();
                        final byteData = await image?.toByteData(
                            format: ImageByteFormat.png);
                        var imageBytes = byteData?.buffer.asUint8List();

                        if (imageBytes != null &&
                            imageBytes1 != null &&
                            imageBytes2 != null &&
                            imageBytes3 != null) {
                          final directory =
                              await getApplicationDocumentsDirectory();
                          final imagePath = await File(
                                  '${directory.path}/container_image.png')
                              .create();
                          await imagePath.writeAsBytes(imageBytes);
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: ChangeNotifierProvider.value(
                                      value: variable,
                                      child: PlayPicture(
                                        patch: imageBytes,
                                        directory: directory,
                                        productGagnantList: _productGagnantList[
                                            widget.indexProduct],
                                        patch1: imageBytes1,
                                        patch2: imageBytes2,
                                        patch3: imageBytes3,
                                        statOffre: false,
                                        date: dateTraduction(_resultatDaysList[
                                                    widget.indexResultDays]
                                                .date)[0] +
                                            dateTraduction(_resultatDaysList[
                                                    widget.indexResultDays]
                                                .date)[1] +
                                            dateTraduction(_resultatDaysList[
                                                    widget.indexResultDays]
                                                .date)[2],
                                      ))));
                        }
                      },
                      child: Icon(
                        Icons.share,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ), // icon
                    Text(
                      "Partage",
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ), // text
                  ],
                ),
              ),
            ],
            title: Text("Stats de la journée",
                style: TextStyle(color: Colors.black)),
            centerTitle: true,
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logo.png',
                width: 140,
                height: 140,
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
          height: MediaQuery.of(context).size.height / 1,
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
                        width: MediaQuery.of(context).size.width / 1,
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
                            padding: const EdgeInsets.all(20.0),
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
                    RepaintBoundary(
                      key: key,
                      child: Container(
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
                                            MediaQuery.of(context).size.width /
                                                1.2,
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
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
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
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 15.0,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 10.0,
                                                    width: 10.0,
                                                    decoration:
                                                        new BoxDecoration(
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.blueAccent),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 15),
                                            child: Row(
                                              children: [
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
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 10.0,
                                                    width: 10.0,
                                                    decoration:
                                                        new BoxDecoration(
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.cyanAccent,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 15),
                                            child: Row(
                                              children: [
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: widget
                                                                  .resultatDaysList
                                                                  .margeDays
                                                                  .roundToDouble() <
                                                              0
                                                          ? Colors.red
                                                          : Colors
                                                              .lightGreenAccent),
                                                ),
                                              ],
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
                                                maxHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        12,
                                                values: [
                                                  ((widget.resultatDaysList
                                                                  .coutDaysProduit +
                                                              widget
                                                                  .resultatDaysList
                                                                  .facebookDepenseDays +
                                                              widget
                                                                  .resultatDaysList
                                                                  .prixShippingDays) <
                                                          widget
                                                              .resultatDaysList
                                                              .chiffreAffaireDays)
                                                      ? (((widget.resultatDaysList
                                                                  .coutDaysProduit /
                                                              widget
                                                                  .resultatDaysList
                                                                  .chiffreAffaireDays) *
                                                          100))
                                                      : (((widget.resultatDaysList
                                                                  .coutDaysProduit /
                                                              (widget.resultatDaysList
                                                                      .coutDaysProduit +
                                                                  widget
                                                                      .resultatDaysList
                                                                      .facebookDepenseDays +
                                                                  widget
                                                                      .resultatDaysList
                                                                      .prixShippingDays)) *
                                                          100)),
                                                  ((widget.resultatDaysList
                                                                  .coutDaysProduit +
                                                              widget
                                                                  .resultatDaysList
                                                                  .facebookDepenseDays +
                                                              widget
                                                                  .resultatDaysList
                                                                  .prixShippingDays) <
                                                          widget
                                                              .resultatDaysList
                                                              .chiffreAffaireDays)
                                                      ? (((widget.resultatDaysList
                                                                  .facebookDepenseDays /
                                                              widget
                                                                  .resultatDaysList
                                                                  .chiffreAffaireDays) *
                                                          100))
                                                      : (((widget.resultatDaysList
                                                                  .facebookDepenseDays /
                                                              (widget.resultatDaysList
                                                                      .coutDaysProduit +
                                                                  widget
                                                                      .resultatDaysList
                                                                      .facebookDepenseDays +
                                                                  widget
                                                                      .resultatDaysList
                                                                      .prixShippingDays)) *
                                                          100)),
                                                  ((widget.resultatDaysList
                                                                  .coutDaysProduit +
                                                              widget
                                                                  .resultatDaysList
                                                                  .facebookDepenseDays +
                                                              widget
                                                                  .resultatDaysList
                                                                  .prixShippingDays) <
                                                          widget
                                                              .resultatDaysList
                                                              .chiffreAffaireDays)
                                                      ? (((widget.resultatDaysList
                                                                  .prixShippingDays /
                                                              widget
                                                                  .resultatDaysList
                                                                  .chiffreAffaireDays) *
                                                          100))
                                                      : (((widget.resultatDaysList
                                                                  .prixShippingDays /
                                                              (widget.resultatDaysList
                                                                      .coutDaysProduit +
                                                                  widget
                                                                      .resultatDaysList
                                                                      .facebookDepenseDays +
                                                                  widget
                                                                      .resultatDaysList
                                                                      .prixShippingDays)) *
                                                          100)),
                                                  widget.resultatDaysList
                                                              .margeDays >
                                                          0
                                                      ? (((widget.resultatDaysList
                                                                  .margeDays /
                                                              widget
                                                                  .resultatDaysList
                                                                  .chiffreAffaireDays) *
                                                          100))
                                                      : 0
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
                                                  widget.resultatDaysList
                                                              .margeDays
                                                              .roundToDouble() <
                                                          0
                                                      ? Colors.red
                                                      : Colors.lightGreenAccent
                                                ],
                                                animationDuration: Duration(
                                                    milliseconds: 1500),
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
                    ),
                    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    RepaintBoundary(
                      key: key1,
                      child: Container(
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
                                            MediaQuery.of(context).size.width /
                                                1.2,
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
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
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
                                            MediaQuery.of(context).size.width /
                                                1.2,
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.15,
                                                    child: PieChart(
                                                      legendIconSize: 5,
                                                      legendItemPadding:
                                                          EdgeInsets.all(2),
                                                      legendIconShape:
                                                          LegendIconShape
                                                              .Circle,
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
                                                          listeDeCouleurOffre()
                                                                      .length <=
                                                                  1
                                                              ? [100]
                                                              : statOffre(
                                                                  totalOffre()),
                                                      labels: statOffreString(),
                                                      sliceFillColors:
                                                          listeDeCouleurOffre(),
                                                      animationDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  1500),
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
                                                                    (listeColors.length -
                                                                            1) -
                                                                        index],
                                                                shape: BoxShape
                                                                    .circle,
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
                                                                    FontWeight
                                                                        .bold,
                                                                color: listeColors[
                                                                    (listeColors.length -
                                                                            1) -
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
                    ),
                    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    ///   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    RepaintBoundary(
                      key: key2,
                      child: Container(
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
                                            MediaQuery.of(context).size.width /
                                                1.2,
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
                                                    SizedBox(
                                                      width: 25.0,
                                                    ),
                                                    Container(
                                                      height: 10.0,
                                                      width: 10.0,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: Colors.blue,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
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
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                            shape:
                                                                BoxShape.circle,
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
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 150,
                                                      child: PieChart(
                                                        textScaleFactor: 0.1,
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3,
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                        context)
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
                                                          Colors
                                                              .lightGreenAccent,
                                                          Colors.blue
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
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 10.0,
                                                          width: 10.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: Colors
                                                                .amberAccent,
                                                            shape:
                                                                BoxShape.circle,
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
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 150,
                                                      child: PieChart(
                                                        textScaleFactor: 0.1,
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3,
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                        context)
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
                                                          Colors.amberAccent,
                                                          Colors.blue
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
                    ),
                    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    RepaintBoundary(
                      key: key3,
                      child: Container(
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
                                                1.2,
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
                                                1.2,
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
                                                1.2,
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
                                                      width: 170,
                                                      child: PieChart(
                                                        textScaleFactor: 0.0,
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.2,
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
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
