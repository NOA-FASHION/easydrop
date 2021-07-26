// import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'creatProduct.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
              title: Text(""),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 10),
                  child: SizedBox.fromSize(
                    size: Size(50, 50), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.purple, // button color
                      ),
                    ),
                  ),
                ),
              ],
              // leading: IconButton(
              //   alignment: Alignment.topRight,
              //   icon: Icon(
              //     Icons.menu,
              //     color: Colors.black,
              //   ),
              //   onPressed: () {
              //     // _controller.toggle();
              //   },
              // ),
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
            child: CreateProduct(),
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
                            // IconButton(
                            //   alignment: Alignment.topRight,
                            //   icon: Icon(
                            //     Icons.cancel,
                            //     color: Colors.black,
                            //   ),
                            //   onPressed: () {
                            //     Navigator.pop(context);
                            //   },
                            // ),
                            SizedBox(
                              height: 5.0,
                            ),
                            ///////////////////////////////////
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  height: 500,
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    elevation: 15.0,
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
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Text(
                                                  "CARACTERISTIQUE DU PRODUIT"),
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
                                              var targetChallenge = value;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Merci d'entrer une description pour la mission";
                                              } else if (value.length > 35) {
                                                return "Pas plus de 50 caractères";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            style: TextStyle(fontSize: 10),
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            onSaved: (value) {
                                              var targetChallenge = value;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Merci d'entrer une description pour la mission";
                                              } else if (value.length > 35) {
                                                return "Pas plus de 50 caractères";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            style: TextStyle(fontSize: 10),
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            onSaved: (value) {
                                              var targetChallenge = value;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Merci d'entrer une description pour la mission";
                                              } else if (value.length > 35) {
                                                return "Pas plus de 50 caractères";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            style: TextStyle(fontSize: 10),
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            onSaved: (value) {
                                              var targetChallenge = value;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Merci d'entrer une description pour la mission";
                                              } else if (value.length > 35) {
                                                return "Pas plus de 50 caractères";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            style: TextStyle(fontSize: 10),
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            onSaved: (value) {
                                              var targetChallenge = value;
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Merci d'entrer une description pour la mission";
                                              } else if (value.length > 35) {
                                                return "Pas plus de 50 caractères";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
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
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      height: 210,
                                      child: Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          elevation: 15.0,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              Card(
                                                elevation: 15.0,
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Center(
                                                    child: Text(
                                                        "PHOTO DU PRODUIT"),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        "https://cdn.pixabay.com/photo/2017/10/12/20/15/photoshop-2845779_960_720.jpg"),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      height: 290,
                                      child: Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        elevation: 15.0,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            Card(
                                              elevation: 15.0,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Center(
                                                  child:
                                                      Text("ADRESSE INTERNET"),
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
                                                style: TextStyle(fontSize: 10),
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                onSaved: (value) {
                                                  var targetChallenge = value;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Merci d'entrer une description pour la mission";
                                                  } else if (value.length >
                                                      35) {
                                                    return "Pas plus de 50 caractères";
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                style: TextStyle(fontSize: 10),
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                onSaved: (value) {
                                                  var targetChallenge = value;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Merci d'entrer une description pour la mission";
                                                  } else if (value.length >
                                                      35) {
                                                    return "Pas plus de 50 caractères";
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
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
                                                  labelText: "Site AliExpress",
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
                                                style: TextStyle(fontSize: 10),
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                onSaved: (value) {
                                                  var targetChallenge = value;
                                                },
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Merci d'entrer une description pour la mission";
                                                  } else if (value.length >
                                                      35) {
                                                    return "Pas plus de 50 caractères";
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
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
                                                  labelText: "facebook",
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
                                      // Provider.of<Challengecontroller>(context,
                                      //         listen: false).

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
