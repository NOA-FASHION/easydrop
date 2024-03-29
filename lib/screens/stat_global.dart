import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:easydrop/screens/image_capture.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image/image.dart' as IMG;
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

Uint8List? resizeImage(Uint8List data) {
  Uint8List? resizedData = data;
  IMG.Image? img = IMG.decodeImage(data);
  IMG.Image resized = IMG.copyResize(img!, width: 700, height: 1900);
  resizedData = IMG.encodeJpg(resized) as Uint8List?;
  return resizedData;
}

class _StatGlobalState extends State<StatGlobal> {
  int _counter = 0;
  // late Uint8List _imageFile;
  final key = GlobalKey();
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
    DateTime today = new DateTime.now();
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
                        // var imageBytes1 = resizeImage(imageBytes!);

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
                                        date: DateFormat('yyyy-MM-dd')
                                            .format(today),
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
            title: Text(
              "Stats globales",
              style: TextStyle(color: Colors.black),
            ),
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
                                              "statistique global"
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
                                              "Nom du produit: ".toUpperCase() +
                                                  _productGagnantList[
                                                          widget.indexProduct]
                                                      .nomProduit,
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
                                              "Type de produit: "
                                                      .toUpperCase() +
                                                  _productGagnantList[
                                                          widget.indexProduct]
                                                      .typeDuProduit,
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
                      width: MediaQuery.of(context).size.width / 1.13,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                                      _productGagnantList[widget
                                                              .indexProduct]
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        Text("Site internet"),
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
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                                      _productGagnantList[widget
                                                              .indexProduct]
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                                      _productGagnantList[widget
                                                              .indexProduct]
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text("Aliexpress"),
                                                  )),
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
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                              Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                elevation: 15.0,
                                                child: Container(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.file(
                                                      File(_productGagnantList[
                                                              widget
                                                                  .indexProduct]
                                                          .photoProduit),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      height: 60,
                                                    ),
                                                  ),
                                                ),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        variable
                                                            .coutProductTotal(
                                                                widget
                                                                    .indexProduct)
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
                                                      variable
                                                          .pubTotal(widget
                                                              .indexProduct)
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
                                                        variable
                                                            .shippingTotal(widget
                                                                .indexProduct)
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
                                                      variable
                                                          .margeTotal(widget
                                                              .indexProduct)
                                                          .roundToDouble()
                                                          .toString() +
                                                      "€",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: variable
                                                                  .margeTotal(widget
                                                                      .indexProduct)
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
                                                  ((variable.coutProductTotal(widget.indexProduct) +
                                                              variable.pubTotal(widget
                                                                  .indexProduct) +
                                                              variable.shippingTotal(
                                                                  widget
                                                                      .indexProduct)) <
                                                          variable.chiffreAffaireTotal(
                                                              widget
                                                                  .indexProduct))
                                                      ? (((variable.coutProductTotal(widget.indexProduct) /
                                                          variable.chiffreAffaireTotal(
                                                              widget
                                                                  .indexProduct) *
                                                          100)))
                                                      : ((variable.coutProductTotal(widget.indexProduct) /
                                                              (variable.coutProductTotal(widget.indexProduct) +
                                                                  variable.pubTotal(
                                                                      widget.indexProduct) +
                                                                  variable.shippingTotal(widget.indexProduct))) *
                                                          100),
                                                  ((variable.coutProductTotal(widget.indexProduct) +
                                                              variable.pubTotal(
                                                                  widget
                                                                      .indexProduct) +
                                                              variable.shippingTotal(
                                                                  widget
                                                                      .indexProduct)) <
                                                          variable.chiffreAffaireTotal(
                                                              widget
                                                                  .indexProduct))
                                                      ? (((variable.pubTotal(widget.indexProduct) /
                                                          variable.chiffreAffaireTotal(
                                                              widget
                                                                  .indexProduct) *
                                                          100)))
                                                      : ((variable.pubTotal(widget.indexProduct) /
                                                              (variable.coutProductTotal(widget.indexProduct) +
                                                                  variable.pubTotal(
                                                                      widget.indexProduct) +
                                                                  variable.shippingTotal(widget.indexProduct))) *
                                                          100),
                                                  ((variable.coutProductTotal(widget.indexProduct) +
                                                              variable.pubTotal(widget
                                                                  .indexProduct) +
                                                              variable.shippingTotal(
                                                                  widget
                                                                      .indexProduct)) <
                                                          variable.chiffreAffaireTotal(
                                                              widget
                                                                  .indexProduct))
                                                      ? (((variable.shippingTotal(widget.indexProduct) /
                                                          variable.chiffreAffaireTotal(
                                                              widget
                                                                  .indexProduct) *
                                                          100)))
                                                      : ((variable.shippingTotal(widget.indexProduct) /
                                                              (variable.coutProductTotal(widget.indexProduct) +
                                                                  variable.pubTotal(
                                                                      widget.indexProduct) +
                                                                  variable.shippingTotal(widget.indexProduct))) *
                                                          100),
                                                  variable.margeTotal(widget
                                                              .indexProduct) >
                                                          0
                                                      ? (((variable.margeTotal(
                                                                  widget
                                                                      .indexProduct) /
                                                              variable.chiffreAffaireTotal(
                                                                  widget
                                                                      .indexProduct)) *
                                                          100))
                                                      : 0
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
                                                  variable
                                                              .margeTotal(widget
                                                                  .indexProduct)
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
                                                          "Nombre total de vente par offres ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.blue),
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
                                                      values: listeDeCouleurOffre(
                                                                      _productGagnantList[
                                                                          widget
                                                                              .indexProduct])
                                                                  .length <=
                                                              1
                                                          ? [100]
                                                          : statOffre(
                                                              totalOffre(
                                                                  _productGagnantList[
                                                                      widget
                                                                          .indexProduct]),
                                                              _productGagnantList[
                                                                  widget
                                                                      .indexProduct]),
                                                      labels: statOffreString(
                                                          _productGagnantList[
                                                              widget
                                                                  .indexProduct]),
                                                      sliceFillColors:
                                                          listeDeCouleurOffre(
                                                              _productGagnantList[
                                                                  widget
                                                                      .indexProduct]),
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
                                                      itemCount: _productGagnantList[
                                                              widget
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
                                                                  _productGagnantList[
                                                                          widget
                                                                              .indexProduct]
                                                                      .nombreVenteOffreTotal[index],
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
                                                              variable
                                                                  .nombrePanierTotal(
                                                                      widget
                                                                          .indexProduct)
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
                                                          ((variable.nombrePanierTotal(
                                                                          widget
                                                                              .indexProduct) /
                                                                      variable.nombreVueTotal(
                                                                          widget
                                                                              .indexProduct)) *
                                                                  100)
                                                              .roundToDouble(),
                                                          (((variable.nombreVueTotal(widget
                                                                              .indexProduct) -
                                                                          variable.nombrePanierTotal(widget
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
                                                              variable
                                                                  .nombreVenteTotal(
                                                                      widget
                                                                          .indexProduct)
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
                                                          ((variable.nombreVenteTotal(
                                                                          widget
                                                                              .indexProduct) /
                                                                      variable.nombreVueTotal(
                                                                          widget
                                                                              .indexProduct)) *
                                                                  100)
                                                              .roundToDouble(),
                                                          (((variable.nombreVueTotal(widget
                                                                              .indexProduct) -
                                                                          variable.nombreVenteTotal(widget
                                                                              .indexProduct)) /
                                                                      variable.nombreVueTotal(
                                                                          widget
                                                                              .indexProduct)) *
                                                                  100)
                                                              .roundToDouble(),
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
                      child: Row(
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
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
                                                          "Roas: " +
                                                              (variable.chiffreDaffaireTotal(
                                                                          widget
                                                                              .indexProduct) /
                                                                      variable.margeTotal(
                                                                          widget
                                                                              .indexProduct))
                                                                  .toStringAsFixed(
                                                                      2),
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
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
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
                                                        Container(
                                                          height: 10.0,
                                                          width: 10.0,
                                                          decoration:
                                                              new BoxDecoration(
                                                            color: Colors
                                                                .greenAccent,
                                                            shape:
                                                                BoxShape.circle,
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
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
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
                                                          width: 170,
                                                          child: PieChart(
                                                            size: Size.fromWidth(
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    2.1),
                                                            textScaleFactor:
                                                                0.0,
                                                            maxWidth: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.2,
                                                            maxHeight: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                14,
                                                            values: [
                                                              ((variable.margeTotal(widget
                                                                              .indexProduct) /
                                                                          variable
                                                                              .chiffreAffaireTotal(widget.indexProduct)) *
                                                                      100)
                                                                  .roundToDouble(),
                                                              100 -
                                                                  (((variable.margeTotal(widget.indexProduct) /
                                                                              variable.chiffreAffaireTotal(widget.indexProduct))) *
                                                                          100)
                                                                      .roundToDouble()
                                                            ],
                                                            labels: [
                                                              'Marge',
                                                              'frais'
                                                            ],
                                                            sliceFillColors: [
                                                              Colors
                                                                  .greenAccent,
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

                          //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
