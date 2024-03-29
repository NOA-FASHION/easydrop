import 'dart:io';

import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:easydrop/screens/edit_result_days.dart';
import 'package:easydrop/screens/stat_days.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:multi_charts/multi_charts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class BuildResultDays extends StatefulWidget {
  final String idProduct;
  final int indexProduct;
  BuildResultDays(this.idProduct, this.indexProduct);

  @override
  _BuildResultDaysState createState() => _BuildResultDaysState();
}

class _BuildResultDaysState extends State<BuildResultDays> {
  Widget maxLetter(String word) {
    Widget longLetter;

    String word2;

    if (word.length >= 21) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.9,
        color: Colors.transparent,
        child: MarqueeText(
          text: word,
          style: TextStyle(
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else {
      word2 = word;
      longLetter = Text(word2);
    }
    return longLetter;
  }

  _editProduct(int indexResultDays, Challengecontroller variable) {
    // var baseDialog = EditProduitGagnant();
    showDialog(
        context: context,
        builder: (context) {
          return ChangeNotifierProvider.value(
              value: variable,
              child: EditResultDays(
                idProduct: widget.idProduct,
                indexProduct: widget.indexProduct,
                indexResultDays: indexResultDays,
              ));
        });
  }

  Widget maxLetterTitre(String word) {
    Widget longLetter;

    String word2;
    if (word.length > 20) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.transparent,
        child: MarqueeText(
          text: word,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else if (word.length > 35) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 1.45,
        color: Colors.transparent,
        child: MarqueeText(
          text: word,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          speed: 30,
        ),
      );
      return longLetter;
    } else {
      word2 = word;
      longLetter = Text(
        word2,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    }
    return longLetter;
  }

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

  Widget activeGlow(
      ResultJournee resultDays, List<ProduitGagnant> _listProduitGagnant) {
    Widget glow = Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white70),
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
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 25.0,
                      child: Row(
                        children: [
                          Text(
                            "Chiffre d'affaire",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                          SizedBox(
                            width: 32.0,
                          ),
                          maxLetter(resultDays.chiffreAffaireDays
                                  .roundToDouble()
                                  .toString() +
                              "€"),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 30.0,
                      child: Row(
                        children: [
                          Text(
                            "Marge de la journée",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            resultDays.margeDays.roundToDouble().toString() +
                                "€",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 90,
                  child: PieChart(
                    textScaleFactor: 0.0,
                    maxWidth: MediaQuery.of(context).size.width / 4.3,
                    maxHeight: MediaQuery.of(context).size.height / 14,
                    values: [
                      ((resultDays.margeDays / resultDays.chiffreAffaireDays) *
                              100)
                          .roundToDouble(),
                      100 -
                          ((resultDays.margeDays /
                                      resultDays.chiffreAffaireDays) *
                                  100)
                              .roundToDouble()
                    ],
                    labels: ['Marge', 'frais'],
                    sliceFillColors: [Colors.greenAccent, Colors.red],
                    animationDuration: Duration(milliseconds: 1500),
                    showLegend: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return glow;
  }

  String imageproductGagnant(List<ProduitGagnant> _listProduitGagnant) {
    String imageProduct = "";
    for (var i = _listProduitGagnant.length - 1; i >= 0; i--) {
      if (_listProduitGagnant[i].id == widget.idProduct) {
        imageProduct = _listProduitGagnant[i].photoProduit;
      }
    }
    return imageProduct;
  }

  String unityPattern = "unity_challenge.";
  @override
  Widget build(BuildContext context) {
    DateTime today = new DateTime.now();
    String todays = DateFormat('EEEE, d MMM, yyyy').format(today);
    Challengecontroller variable = Provider.of<Challengecontroller>(context);
    List<ResultJournee> _resultatDaysList =
        variable.getResulDays(widget.idProduct);
    List<ProduitGagnant> ListProduitGagnant = variable.getProduitGagnant();

    if (_resultatDaysList.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "Pas de résultats.",
          style: TextStyle(color: Colors.orange[600], fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      itemCount: _resultatDaysList.length,
      itemBuilder: (context, index) {
        print(_resultatDaysList[index].date.toString());
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
          child: Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                variable.removeResultatDays(
                  index: index,
                  indexProduct: widget.indexProduct,
                  idProduct: widget.idProduct,
                );
                Scaffold.of(context).showSnackBar(_buildSnackBar(
                    content: "Le produit a bien été supprimée",
                    lotties: 'assets/trash.json'));
              }

              if (direction == DismissDirection.startToEnd) {
                variable.removeResultatDays(
                  index: index,
                  indexProduct: widget.indexProduct,
                  idProduct: widget.idProduct,
                );
                Scaffold.of(context).showSnackBar(_buildSnackBar(
                    content: "Le produit a bien été supprimée",
                    lotties: 'assets/trash.json'));
              }
            },
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                final bool? resultat = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Confirmation",
                          style: TextStyle(color: Colors.blue),
                        ),
                        content: Text("Voulez vous supprimer le produit"),
                        actions: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text("Oui"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: Text("Non"),
                          )
                        ],
                      );
                    });
                return resultat;
              }
              if (direction == DismissDirection.endToStart) {
                final bool? resultat = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Confirmation",
                          style: TextStyle(color: Colors.blue),
                        ),
                        content: Text("Voulez vous supprimer le produit"),
                        actions: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text("Oui"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: Text("Non"),
                          )
                        ],
                      );
                    });
                return resultat;
              }
              return true;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete,
                size: 55.0,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                size: 55.0,
                color: Colors.white,
              ),
            ),
            key: Key(UniqueKey().toString()),
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
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: ChangeNotifierProvider.value(
                                value: variable,
                                child: StatDays(
                                  resultatDaysList: _resultatDaysList[index],
                                  indexProduct: widget.indexProduct,
                                  idProduct: widget.idProduct,
                                  indexResultDays: index,
                                ))));
                  },
                  title: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 15.0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Date".toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  maxLetterTitre(
                                    "Résultat du ".toUpperCase() +
                                        dateTraduction(_resultatDaysList[index]
                                                .date)[0]
                                            .toString()
                                            .toUpperCase() +
                                        dateTraduction(_resultatDaysList[index]
                                                .date)[1]
                                            .toString()
                                            .toUpperCase() +
                                        dateTraduction(_resultatDaysList[index]
                                                .date)[2]
                                            .toString()
                                            .toUpperCase(),
                                  ),
                                  // IconButton(
                                  //   padding: EdgeInsets.all(0),
                                  //   iconSize: 20,
                                  //   icon: Icon(
                                  //     Icons.edit,
                                  //     color: Colors.blue,
                                  //   ),
                                  //   onPressed: () {
                                  //     _editProduct(index, variable);
                                  //   },
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                  ),
                  subtitle:
                      activeGlow(_resultatDaysList[index], ListProduitGagnant),
                  isThreeLine: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SnackBar _buildSnackBar({@required String? content, String? lotties}) {
    return SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.white,
      content: Container(
        height: 80,
        child: Row(
          children: [
            Lottie.asset(lotties!, width: 60),
            Text(
              content!,
              style: TextStyle(color: Colors.purple),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SizeTransition3 extends PageRouteBuilder {
  final Widget page;

  SizeTransition3(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1000),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
