// import 'package:fancy_drawer/fancy_drawer.dart';

import 'package:currency_textfield/currency_textfield.dart';
import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'buildProduct.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var controller = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  var controller1 = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  var controller2 = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");

  late PersistentBottomSheetController _bottomSheetController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  // late FancyDrawerController _controller;
  void initState() {
    super.initState();

    // _controller =
    //     FancyDrawerController(vsync: this, duration: Duration(milliseconds: 50))
    //       ..addListener(() {
    //         setState(() {}); // Must call setState
    //       }); // This chunk of code is important
  }

  bool _visibility1 = true;

  String wait = "assets/wait.json";
  late String dataJoin;
  late String _image;
  final picker = ImagePicker();
  double chiffreAffaireTotal = 0;
  double coutTotalProduit = 0;
  double facebookDepenseTotal = 0;
  double margeTotal = 0;
  double prixShippingTotal = 0;
  double venteTotal = 0.0;
  int vueTotal = 0;
  double roaTotal = 0;
  late String nomProduit;
  late String typeDuProduit;
  late double prixAchat;
  late double prixVente;
  late double prixShipping;
  late String siteVente;
  late String siteAliexpress;
  late String facebookAdress;
  List<String> nombreVenteOffreTotal = [];
  List<ResultJournee> listeResultatJournee = [];
  List<Offre> listeOffre = [];
  String photoProduit = "";
  int panierTotal = 0;
  @override
  Widget build(BuildContext context) {
    // Challengecontroller variable = Provider.of<Challengecontroller>(context);
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: SafeArea(
            child: AppBar(
              elevation: 0,
              title: Text(
                "Produits",
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
            child: BuildProduct(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: buildBottomSheet(),
      ),
    );
  }

  Future getImageCamera() async {
    _bottomSheetController.setState!(() {
      _changeVisibility(false);
    });
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        dataJoin = pickedFile.path;
        _image = pickedFile.path;
        _bottomSheetController.setState!(() {
          wait = "assets/picture.json";
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageGallery() async {
    _bottomSheetController.setState!(() {
      _changeVisibility(false);
    });
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        dataJoin = pickedFile.path;
        _image = pickedFile.path;
        _bottomSheetController.setState!(() {
          wait = "assets/picture.json";
        });
      } else {
        print('No image selected.');
      }
    });
  }

  void _changeVisibility(bool visibility) {
    setState(() {
      _visibility1 = visibility;
    });
  }

  Widget selectdropdown() {
    Widget documentJoint = SizedBox(
      width: 1.0,
    );

    documentJoint = Column(
      children: [
        Offstage(
          offstage: _visibility1,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.2,
            height: 70,
            child: Center(child: Lottie.asset(wait)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () async {
                  getImageGallery();
                },
                child: Container(
                    width: 70.0,
                    height: 80.0,
                    child: Lottie.asset('assets/upload.json'))),
            SizedBox(
              width: 15.0,
            ),
            InkWell(
                onTap: () async {
                  getImageCamera();
                },
                child: Container(
                    width: 70.0,
                    height: 120.0,
                    child: Lottie.asset('assets/photo.json'))),
          ],
        ),
      ],
    );
    return documentJoint;
  }

  updateController(dynamic value) {
    _bottomSheetController.setState!(() {
      var unityChallenge = value;
    });
  }

  FloatingActionButton buildBottomSheet() {
    return FloatingActionButton(
        // child: Lottie.asset('assets/float.json'),
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        onPressed: () {
          _visibility1 = true;
          wait = "assets/wait.json";
          _bottomSheetController = scaffoldkey.currentState!.showBottomSheet(
            (context) {
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 1.2,
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5.0,
                            ),
                            ///////////////////////////////////
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  height: 610,
                                  child: Card(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 15.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: <Color>[
                                                  Colors.orange,
                                                  Colors.pink
                                                ])),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 30.0,
                                            ),
                                            Card(
                                              elevation: 15.0,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Center(
                                                  child: Text(
                                                    "CARACTERISTIQUE DU PRODUIT",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                onSaved: (value) {
                                                  nomProduit = value!;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Merci d'entrer le nom du produit";
                                                  } else if (value.length >
                                                      35) {
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
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1.0,
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                  labelText: "Nom du produit",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                onSaved: (value) {
                                                  typeDuProduit = value!;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Merci d'entrer le type de produit";
                                                  } else if (value.length >
                                                      35) {
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
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1.0,
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                  labelText: "Type de produit",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: controller,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                onSaved: (value) {
                                                  prixAchat =
                                                      controller.doubleValue;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Merci d'entrer le prix d'achat du produit";
                                                  } else if (value.length >
                                                      35) {
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
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1.0,
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                  labelText: "Prix d'achat",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: controller1,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                onSaved: (value) {
                                                  prixVente =
                                                      controller1.doubleValue;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Merci d'entrer le prix de vente du produit";
                                                  } else if (value.length >
                                                      35) {
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
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1.0,
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                  labelText: "Prix de vente",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: controller2,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                onSaved: (value) {
                                                  prixShipping =
                                                      controller2.doubleValue;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Merci d'entrer le prix du shipping";
                                                  } else if (value.length >
                                                      35) {
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
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1.0,
                                                          color: Colors
                                                              .blueAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                  labelText: "Prix shipping",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      height: 260,
                                      child: Card(
                                          color: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          elevation: 15.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: <Color>[
                                                        Colors.orange,
                                                        Colors.pink
                                                      ])),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Card(
                                                      elevation: 15.0,
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Center(
                                                          child: Text(
                                                            "PHOTO DU PRODUIT",
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: selectdropdown(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      height: 350,
                                      child: Card(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        elevation: 15.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: <Color>[
                                                      Colors.orange,
                                                      Colors.pink
                                                    ])),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Card(
                                                  elevation: 15.0,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Center(
                                                      child: Text(
                                                          "ADRESSE INTERNET"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    onSaved: (value) {
                                                      siteVente = value!;
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Merci d'entrer l'adresse du site de vente";
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
                                                              color: Colors
                                                                  .blueAccent),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1.0,
                                                              color: Colors
                                                                  .blueAccent),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 10),
                                                      labelText:
                                                          "Site de vente",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white),
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    onSaved: (value) {
                                                      siteAliexpress = value!;
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Merci d'entrer l'adresse du site d'achat";
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
                                                              color: Colors
                                                                  .blueAccent),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1.0,
                                                              color: Colors
                                                                  .blueAccent),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 10),
                                                      labelText:
                                                          "Site AliExpress",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    onSaved: (value) {
                                                      facebookAdress = value!;
                                                    },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Merci d'entrer l'adresse de la page facebook";
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
                                                              color: Colors
                                                                  .blueAccent),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1.0,
                                                              color: Colors
                                                                  .blueAccent),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 10),
                                                      labelText: "facebook",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0)),
                                                    ),
                                                  ),
                                                ),
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

                            SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: IconButton(
                                iconSize: 60,
                                alignment: Alignment.topRight,
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Colors.orange[900],
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    {
                                      Provider.of<Challengecontroller>(context,
                                              listen: false)
                                          .addProductGagant(
                                              coutTotalProduit:
                                                  coutTotalProduit,
                                              facebookAdress: facebookAdress,
                                              facebookDepenseTotal:
                                                  facebookDepenseTotal,
                                              margeTotal: margeTotal,
                                              prixAchat: prixAchat,
                                              prixShippingTotal:
                                                  prixShippingTotal,
                                              prixVente: prixVente,
                                              roaTotal: roaTotal,
                                              venteTotal: venteTotal,
                                              vueTotal: vueTotal,
                                              listeOffre: listeOffre,
                                              listeResultatJournee:
                                                  listeResultatJournee,
                                              photoProduit: dataJoin,
                                              typeDuProduit: typeDuProduit,
                                              panierTotal: panierTotal,
                                              nombreVenteOffreTotal:
                                                  nombreVenteOffreTotal,
                                              nomProduit: nomProduit,
                                              siteAliexpress: siteAliexpress,
                                              siteVente: siteVente,
                                              prixShipping: prixShipping,
                                              idProduct: (nanoid(9)),
                                              chiffreAffaireTotal:
                                                  chiffreAffaireTotal);

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
                  ));
            },
          );
        });
  }
}
