import 'dart:io';
import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:easydrop/screens/edit_produit_gagnant.dart';
import 'package:easydrop/screens/resultat_Days.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class BuildProduct extends StatefulWidget {
  BuildProduct({Key? key}) : super(key: key);

  @override
  _BuildProductState createState() => _BuildProductState();
}

class _BuildProductState extends State<BuildProduct> {
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

  Widget maxLetterTitre(String word) {
    Widget longLetter;

    String word2;
    if (word.length > 15) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2.79,
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
    } else if (word.length > 20) {
      longLetter = Container(
        width: MediaQuery.of(context).size.width / 2,
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

  _editProduct(int indexProduct, Challengecontroller variable) {
    // var baseDialog = EditProduitGagnant();
    showDialog(
        context: context,
        builder: (context) {
          return ChangeNotifierProvider.value(
              value: variable,
              child: EditProduitGagnant(
                indexProduitGagnant: indexProduct,
              ));
        });
  }

  Widget activeGlow(ProduitGagnant product) {
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
                            "Type de produit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          maxLetter(product.typeDuProduit),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 30.0,
                      child: Row(
                        children: [
                          Text(
                            "prix d'achat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 35.0,
                          ),
                          Text(
                            product.prixAchat.toString() + "€",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 30.0,
                      child: Row(
                        children: [
                          Text(
                            "prix du produit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Text(
                            product.prixVente.toString() + "€",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(
                      File(product.photoProduit),
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 11,
                    ),
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

  String unityPattern = "unity_challenge.";
  @override
  Widget build(BuildContext context) {
    Challengecontroller variable = Provider.of<Challengecontroller>(context);
    List<ProduitGagnant> _productGagnantList = variable.getProduitGagnant();

    if (_productGagnantList.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "Pas de produits.",
          style: TextStyle(color: Colors.orange[600], fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      itemCount: _productGagnantList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 3.0, left: 8.0, right: 8.0),
          child: Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                variable.remove(
                  index: index,
                );
                Scaffold.of(context).showSnackBar(_buildSnackBar(
                    content: "Le produit a bien été supprimée",
                    lotties: 'assets/trash.json'));
              }

              if (direction == DismissDirection.startToEnd) {
                variable.remove(
                  index: index,
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
                                child: ResultDays(
                                    index, _productGagnantList[index].id))));
                  },
                  title: Container(
                    height: 35,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 15.0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Nom du Produit".toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  maxLetterTitre(_productGagnantList[index]
                                      .nomProduit
                                      .toUpperCase()),
                                  IconButton(
                                    padding: EdgeInsets.all(0),
                                    iconSize: 20,
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      _editProduct(index, variable);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: activeGlow(_productGagnantList[index]),
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
