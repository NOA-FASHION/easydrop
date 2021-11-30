import 'package:currency_textfield/currency_textfield.dart';
import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/screens/build_offre.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class OffreProduct extends StatefulWidget {
  final int indexProduct;

  final String idProduct;
  OffreProduct(this.indexProduct, this.idProduct);

  @override
  _OffreProductState createState() => _OffreProductState();
}

class _OffreProductState extends State<OffreProduct> {
  late PersistentBottomSheetController _bottomSheetController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  var controller = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  var controller1 = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  var controller2 = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  var controller3 = CurrencyTextFieldController(
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

  Color margeColors = Colors.green;
  Color roaColors = Colors.green;
  String margeText = '0';
  String roaText = '0';
  double roas1 = 0;
  double prixShipping = 0;
  double marge1 = 0;
  double margeOffre = 0;
  double prixAchat = 0;
  double prixBarre = 0;
  int index = 0;
  double prixVente = 0;
  double roas = 0;
  late String offres;

  double validateMarge(GlobalKey<FormState> formKey1) {
    double marge = 0;
    if (formKey1.currentState!.validate()) {
      formKey1.currentState!.save();
      {
        setState(() {
          marge = prixVente - (prixAchat + prixShipping);
          marge1 = marge;
        });
      }
    }
    return marge;
  }

  double validateRoas(GlobalKey<FormState> formKey1) {
    double roas = 0;
    if (formKey1.currentState!.validate()) {
      formKey1.currentState!.save();
      {
        setState(() {
          roas = prixVente / validateMarge(formKey1);
          roas1 = roas;
        });
      }
    }
    return roas;
  }

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
              title: Text(
                "Offres",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 20.0),
                alignment: Alignment.center,
                height: 140,
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
            child: BuildOffre(widget.idProduct, widget.indexProduct),
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
    return FloatingActionButton(
        // child: Lottie.asset('assets/float.json'),
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[900],
        onPressed: () {
          roaText = '0';
          margeText = '0';
          _bottomSheetController = scaffoldkey.currentState!.showBottomSheet(
            (context) {
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Form(
                    key: formKey,
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

                            Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 15.0,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    maxLines: 6,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onSaved: (value) {
                                      offres = value!;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Merci d'entrer une offre'";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3.0,
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
                                      labelText: "Offre",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: controller,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      onSaved: (value) {
                                        prixAchat = controller.doubleValue;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Merci d'entrer le prix d'achat";
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
                                        labelText: "Prix d'achat",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: controller1,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      onSaved: (value) {
                                        prixVente = controller1.doubleValue;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Merci d'entrer le prix de vente";
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
                                        labelText: "Prix de vente",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: controller2,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      onSaved: (value) {
                                        prixShipping = controller2.doubleValue;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Merci d'entrer le prix du shipping";
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
                                        labelText: "Prix du shipping",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.9,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: controller3,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      onSaved: (value) {
                                        prixBarre = controller3.doubleValue;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Merci d'entrer le prix barré";
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
                                        labelText: "prix barré",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    validateMarge(formKey);
                                    _bottomSheetController.setState!(() {
                                      margeText = validateMarge(formKey)
                                          .toStringAsFixed(2);
                                      if (validateMarge(formKey) > 12) {
                                        margeColors = Colors.green;
                                      } else {
                                        margeColors = Colors.red;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3.2,
                                    child: Card(
                                      color: margeColors,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
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
                                                color: margeColors,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                elevation: 15.0,
                                                child: Text("Marge")),
                                          ),
                                          Card(
                                              color: Colors.orange,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(margeText),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    validateRoas(formKey);
                                    _bottomSheetController.setState!(() {
                                      roaText = validateRoas(formKey)
                                          .toStringAsFixed(2);
                                      if (validateRoas(formKey) < 1.80) {
                                        roaColors = Colors.green;
                                      } else {
                                        roaColors = Colors.red;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3.2,
                                    child: Card(
                                      color: roaColors,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
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
                                                color: margeColors,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                elevation: 15.0,
                                                child: Text("Roas")),
                                          ),
                                          Card(
                                              color: Colors.orange,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(roaText),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

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
                                      Provider.of<Challengecontroller>(context,
                                              listen: false)
                                          .addOffreDays(
                                              index: widget.indexProduct,
                                              margeOffre:
                                                  validateMarge(formKey),
                                              prixAchat: prixAchat,
                                              prixShipping: prixShipping,
                                              prixBarre: prixBarre,
                                              prixVente: prixVente,
                                              roas: validateRoas(formKey),
                                              offres: offres);

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
