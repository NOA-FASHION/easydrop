import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:easydrop/screens/build_result_days.dart';
import 'package:easydrop/screens/offre.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ResultDays extends StatefulWidget {
  final int indexProduct;
  final String idProduct;
  ResultDays(this.indexProduct, this.idProduct);

  @override
  _ResultDaysState createState() => _ResultDaysState();
}

class _ResultDaysState extends State<ResultDays> {
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

  double chiffreAffaireDays = 0;
  double facebookDepenseDays = 0;
  double facebookDepenseTotal = 0;
  int panierDays = 0;
  int vueDays = 0;
  double margeTotal = 0;
  double prixShippingTotal = 0;
  double venteTotal = 0.0;
  double venteDays = 0;
  double margeDays = 0;
  List<String> nombreVenteOffreDays = [];
  double coutDaysProduit = 0;
  double prixShippingDays = 0;
  double roaDays = 0;

  String photoProduit = "";

  @override
  Widget build(BuildContext context) {
    // Challengecontroller variable = Provider.of<Challengecontroller>(context);
    return Material(
      child: Scaffold(
        key: scaffoldkey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: SafeArea(
            child: AppBar(
              title: Text("Résultat de la journée"),
              centerTitle: true,
              flexibleSpace: Container(
                padding: EdgeInsets.only(top: 40.0),
                alignment: Alignment.center,
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            Navigator.of(context).push(PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: OffreProduct(
                                    widget.indexProduct, widget.idProduct)));
                          }, // butt
                          child: Icon(
                            Icons.money,
                            size: 20,
                            color: Colors.blue,
                          ),
                        ), // icon
                        Text(
                          "Offre",
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ), // text
                      ],
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 55,
                      height: 130,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.query_stats,
                          size: 20,
                          color: Colors.blue,
                        ), // icon
                        Text(
                          "Stat globale",
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ), // text
                      ],
                    ),
                  ],
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
            child: BuildResultDays(widget.idProduct),
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
          _bottomSheetController = scaffoldkey.currentState!.showBottomSheet(
            (context) {
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.5,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2017/10/12/20/15/photoshop-2845779_960_720.jpg"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(fontSize: 10),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSaved: (value) {
                                  chiffreAffaireDays = double.parse(value!);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Merci d'entrer le chiffe d'affaire de la journée";
                                  } else if (value.length > 35) {
                                    return "Pas plus de 50 caractères";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  labelText: "Chiffre d'affaire de la journée",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(fontSize: 10),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSaved: (value) {
                                  facebookDepenseDays = double.parse(value!);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Merci d'entrer les dépense facebook";
                                  } else if (value.length > 35) {
                                    return "Pas plus de 50 caractères";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  labelText: "Dépense Facebook",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(fontSize: 10),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSaved: (value) {
                                  panierDays = int.parse(value!);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Merci d'entrer le nombre de panier de la journée";
                                  } else if (value.length > 35) {
                                    return "Pas plus de 50 caractères";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  labelText: "Nombre de panier de la journée",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(fontSize: 10),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSaved: (value) {
                                  vueDays = int.parse(value!);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Merci d'entrer le nombre de vue de la journée";
                                  } else if (value.length > 35) {
                                    return "Pas plus de 50 caractères";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  labelText: "le nombre de vuede la journée",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(fontSize: 10),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSaved: (value) {
                                  venteDays = double.parse(value!);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Merci d'entrer le nombre de vente de la journée";
                                  } else if (value.length > 35) {
                                    return "Pas plus de 50 caractères";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.0, color: Colors.blueAccent),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  labelText: "Nombre de vente de la journée",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                ),
                              ),
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
                                          .addResultatDays(
                                        index: widget.indexProduct,
                                        chiffreAffaireDays: chiffreAffaireDays,
                                        facebookDepenseDays:
                                            facebookDepenseDays,
                                        panierDays: panierDays,
                                        vueDays: vueDays,
                                        venteDays: venteDays,
                                        margeDays: margeDays,
                                        nombreVenteOffreDays:
                                            nombreVenteOffreDays,
                                        coutDaysProduit: coutDaysProduit,
                                        prixShippingDays: prixShippingDays,
                                        roaDays: roaDays,
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
                  ));
            },
          );
        });
  }
}
