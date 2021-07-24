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
      // child: FancyDrawerWrapper(
      //   hideOnContentTap: true,
      //   backgroundColor: Colors.white,
      //   controller: _controller,
      //   drawerItems: <Widget>[
      //     InkWell(
      //       onTap: () {
      //         // Navigator.of(context).push(MaterialPageRoute(
      //         //     builder: (context) => ChangeNotifierProvider.value(
      //         //         value: variable,
      //         //         child: Home(
      //         //           id: "",
      //         //           idChallenge1: '',
      //         //           namechallenge: '',
      //         //           returnRaccourci: false,
      //         //         ))));
      //       },
      //       child: Row(
      //         children: [
      //           Icon(Icons.home),
      //           SizedBox(
      //             width: 5.0,
      //           ),
      //           Text(
      //             "Menu",
      //             style: TextStyle(
      //               fontSize: 18,
      //               color: Colors.purple,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 5.0),
      //     InkWell(
      //       onTap: () {
      //         // Navigator.of(context).push(MaterialPageRoute(
      //         //     builder: (context) => ChangeNotifierProvider.value(
      //         //         value: variable, child: ExampleApp())));
      //       },
      //       child: Row(
      //         children: [
      //           Icon(Icons.save_rounded),
      //           SizedBox(
      //             width: 5.0,
      //           ),
      //           Text(
      //             "Sauvegarde challenge",
      //             style: TextStyle(
      //               fontSize: 18,
      //               color: Colors.purple,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 5.0),
      //     // InkWell(
      //     //   onTap: () {
      //     //     // Navigator.of(context).push(MaterialPageRoute(
      //     //     //     builder: (context) => ChangeNotifierProvider.value(
      //     //     //         value: variable, child: ResultaChallenge())));
      //     //   },
      //     //   child: Row(
      //     //     children: [
      //     //       Icon(FontAwesomeIcons.play),
      //     //       SizedBox(
      //     //         width: 5.0,
      //     //       ),
      //     //       Text(
      //     //         "Score des challenges",
      //     //         style: TextStyle(
      //     //           fontSize: 18,
      //     //           color: Colors.purple,
      //     //           fontWeight: FontWeight.bold,
      //     //         ),
      //     //       ),
      //     //     ],
      //     //   ),
      //     // ),
      //     // SizedBox(height: 5.0),
      //     InkWell(
      //       onTap: () {},
      //       child: Row(
      //         children: [
      //           Icon(Icons.support),
      //           SizedBox(
      //             width: 5.0,
      //           ),
      //           Text(
      //             "Support",
      //             style: TextStyle(
      //               fontSize: 18,
      //               color: Colors.purple,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 5.0),
      //     InkWell(
      //       onTap: () {},
      //       child: Row(
      //         children: [
      //           Icon(Icons.policy),
      //           SizedBox(
      //             width: 5.0,
      //           ),
      //           Text(
      //             "À propos",
      //             style: TextStyle(
      //               fontSize: 18,
      //               color: Colors.purple,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
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
              leading: IconButton(
                alignment: Alignment.topRight,
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  // _controller.toggle();
                },
              ),
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
                      child: ListView(
                        padding: EdgeInsets.all(10.0),
                        children: [
                          IconButton(
                            alignment: Alignment.topRight,
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            onSaved: (value) {
                              var nameChallenge = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Merci d'entrer un nom pour le challenge";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                labelText: "Nom de la mission",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.sentences,
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
                                        width: 2.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: "Description",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(15.0)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            value: "",
                            onChanged: (value) {
                              updateController(value);
                            },
                            onSaved: (value) {
                              updateController(value);
                            },
                            items: <DropdownMenuItem<String>>[
                              DropdownMenuItem(
                                value: "haute",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.update,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Haute"),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "normal",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.auto_fix_normal,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Normal"),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "quotidien",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.view_day,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Quotidien"),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "hebdomadaire",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.view_week,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Hebdomadaire"),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "mensuel",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Mensuel"),
                                  ],
                                ),
                              ),
                              DropdownMenuItem(
                                value: "notification",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.schedule,
                                      size: 30.0,
                                    ),
                                    SizedBox(width: 10),
                                    Text("Notification"),
                                  ],
                                ),
                              ),
                            ],
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
                  ));
            },
          );
        });
  }
}
