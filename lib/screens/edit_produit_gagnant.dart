import 'package:currency_textfield/currency_textfield.dart';
import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class EditProduitGagnant extends StatefulWidget {
  // final BuildContext context;
  final int indexProduitGagnant;
  EditProduitGagnant({required this.indexProduitGagnant});

  @override
  _EditProduitGagnantState createState() => _EditProduitGagnantState();
}

class _EditProduitGagnantState extends State<EditProduitGagnant> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _visibility1 = true;
  String dataJoin = "";
  late String _image;
  final picker = ImagePicker();
  String wait = "assets/wait.json";
  double chiffreAffaireTotal = 0;
  double coutTotalProduit = 0;
  double facebookDepenseTotal = 0;
  double margeTotal = 0;
  double prixShippingTotal = 0;
  double venteTotal = 0.0;
  int vueTotal = 0;
  double roaTotal = 0;
  String nomProduit = "";
  String typeDuProduit = "";
  double prixAchat = 0;
  double prixVente = 0;
  double prixShipping = 0;
  String siteVente = "";
  String siteAliexpress = "";
  String facebookAdress = "";
  List<String> nombreVenteOffreTotal = [];
  List<ResultJournee> listeResultatJournee = [];
  List<Offre> listeOffre = [];
  String photoProduit = "";
  int panierTotal = 0;
  Future getImageCamera() async {
    _changeVisibility(false);

    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        dataJoin = pickedFile.path;
        _image = pickedFile.path;
        wait = "assets/picture.json";
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageGallery() async {
    _changeVisibility(false);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        dataJoin = pickedFile.path;
        _image = pickedFile.path;
        wait = "assets/picture.json";
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

  var controller = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  var controller1 = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  var controller2 = CurrencyTextFieldController(
      rightSymbol: "€", decimalSymbol: ".", thousandSymbol: ",");
  @override
  Widget build(BuildContext context) {
    Challengecontroller variable = Provider.of<Challengecontroller>(context);
    List<ProduitGagnant> _productGagnantList = variable.getProduitGagnant();
    return AlertDialog(
      contentPadding: EdgeInsets.all(1),
      backgroundColor: Colors.transparent,
      scrollable: true,
      content: Center(
        child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 1.15,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        ///////////////////////////////////
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
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
                                    borderRadius: BorderRadius.circular(20.0),
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
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Text(
                                            "CARACTERISTIQUES DU PRODUIT",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        onSaved: (value) {
                                          nomProduit = value!;
                                        },
                                        validator: (value) {
                                          if (value!.length > 35) {
                                            return "Pas plus de 50 caractères";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          helperStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                          helperText: "valeur: " +
                                              _productGagnantList[widget
                                                      .indexProduitGagnant]
                                                  .nomProduit,
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
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
                                          labelText: "Nom du produit",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        onSaved: (value) {
                                          typeDuProduit = value!;
                                        },
                                        validator: (value) {
                                          if (value!.length > 35) {
                                            return "Pas plus de 50 caractères";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          helperStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                          helperText: "valeur: " +
                                              _productGagnantList[widget
                                                      .indexProduitGagnant]
                                                  .typeDuProduit,
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
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
                                          labelText: "Type de produit",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Padding(
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
                                          if (value!.length > 35) {
                                            return "Pas plus de 50 caractères";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          helperStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                          helperText: "valeur: " +
                                              _productGagnantList[widget
                                                      .indexProduitGagnant]
                                                  .prixAchat
                                                  .toString() +
                                              " €",
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
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
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Padding(
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
                                          if (value!.length > 35) {
                                            return "Pas plus de 50 caractères";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          helperStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                          helperText: "valeur: " +
                                              _productGagnantList[widget
                                                      .indexProduitGagnant]
                                                  .prixVente
                                                  .toString() +
                                              " €",
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
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
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: controller2,
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        onSaved: (value) {
                                          prixShipping =
                                              controller2.doubleValue;
                                        },
                                        validator: (value) {
                                          if (value!.length > 35) {
                                            return "Pas plus de 50 caractères";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          helperStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                          helperText: "valeur: " +
                                              _productGagnantList[widget
                                                      .indexProduitGagnant]
                                                  .prixShipping
                                                  .toString() +
                                              " €",
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
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
                                          labelText: "Prix shipping",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
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
                              width: MediaQuery.of(context).size.width / 1.4,
                              height: 260,
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
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Card(
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
                                                    "PHOTO DU PRODUIT",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: selectdropdown(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.4,
                              height: 360,
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
                                          height: 10.0,
                                        ),
                                        Card(
                                          elevation: 15.0,
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Text(
                                                "ADRESSES INTERNET",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            onSaved: (value) {
                                              siteVente = value!;
                                            },
                                            // validator: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return "Merci d'entrer l'adresse du site de vente";
                                            //   }
                                            //   return null;
                                            // },
                                            decoration: InputDecoration(
                                              helperStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                              helperText: "valeur: " +
                                                  _productGagnantList[widget
                                                          .indexProduitGagnant]
                                                      .siteVente,
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2.0,
                                                      color: Colors.blueAccent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Colors.blueAccent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              labelText: "Site de vente",
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            onSaved: (value) {
                                              siteAliexpress = value!;
                                            },
                                            // validator: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return "Merci d'entrer l'adresse du site d'achat";
                                            //   }
                                            //   return null;
                                            // },
                                            decoration: InputDecoration(
                                              helperStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                              helperText: "valeur: " +
                                                  _productGagnantList[widget
                                                          .indexProduitGagnant]
                                                      .siteAliexpress,
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2.0,
                                                      color: Colors.blueAccent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Colors.blueAccent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              labelText: "Lien site d'achat",
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            onSaved: (value) {
                                              facebookAdress = value!;
                                            },
                                            // validator: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return "Merci d'entrer l'adresse de la page facebook";
                                            //   }
                                            //   return null;
                                            // },
                                            decoration: InputDecoration(
                                              helperStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                              helperText: "valeur: " +
                                                  _productGagnantList[widget
                                                          .indexProduitGagnant]
                                                      .facebookAdress,
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2.0,
                                                      color: Colors.blueAccent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.0,
                                                      color: Colors.blueAccent),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              labelText: "Lien facebook",
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
                                      .editProductGagant(
                                    facebookAdress: facebookAdress,
                                    prixAchat: prixAchat,
                                    prixVente: prixVente,
                                    photoProduit: dataJoin,
                                    typeDuProduit: typeDuProduit,
                                    nomProduit: nomProduit,
                                    siteAliexpress: siteAliexpress,
                                    siteVente: siteVente,
                                    indexProduct: widget.indexProduitGagnant,
                                    prixShipping: prixShipping,
                                  );

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
              ),
            )),
      ),
    );
  }
}
