import 'dart:io';
import 'dart:typed_data';
import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/models/drop_models.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PlayPicture extends StatelessWidget {
  final bool statOffre;
  final Uint8List patch;
  final Uint8List patch1;
  final Uint8List patch2;
  final Uint8List patch3;
  final Directory directory;
  final ProduitGagnant productGagnantList;
  const PlayPicture(
      {Key? key,
      required this.productGagnantList,
      required this.patch,
      required this.statOffre,
      required this.patch1,
      required this.patch2,
      required this.patch3,
      required this.directory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Challengecontroller variable = Provider.of<Challengecontroller>(context);

    UserDrop userDrop = variable.getUserDrop();
    final pdf = pw.Document();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: SafeArea(
          child: AppBar(
            actions: [
              // Padding(
              //   padding: const EdgeInsets.only(right: 12),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       InkWell(
              //         splashColor: Colors.white,
              //         onTap: () async {
              //           Share.shareFiles(
              //               ['${directory.path}/container_image.png'],
              //               text: 'Great picture');
              //         },
              //         child: Icon(
              //           Icons.picture_in_picture,
              //           size: 30,
              //           color: Colors.blue,
              //         ),
              //       ), // icon
              //       Text(
              //         "Pictures",
              //         style: TextStyle(fontSize: 10, color: Colors.blue),
              //       ), // text
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      splashColor: Colors.white,
                      onTap: () async {
                        pdf.addPage(pw.MultiPage(
                            margin: pw.EdgeInsets.all(10),
                            pageFormat: PdfPageFormat.a4,
                            build: (pw.Context context) {
                              return <pw.Widget>[
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    mainAxisSize: pw.MainAxisSize.min,
                                    children: [
                                      pw.Text("Nom: " + userDrop.nom),
                                      pw.SizedBox(height: 10),
                                      pw.Text("Prénom: " + userDrop.prenom),
                                      pw.SizedBox(height: 10),
                                      pw.Text("Email: " + userDrop.email),
                                      pw.SizedBox(height: 10),
                                      pw.Text(
                                          "Téléphone: " + userDrop.telephone),
                                      pw.SizedBox(height: 10),
                                      pw.Text("Adresse site: " +
                                          productGagnantList.siteVente),
                                      pw.SizedBox(height: 10),
                                      pw.Text("Adresse Facebook: " +
                                          productGagnantList.facebookAdress),
                                      pw.SizedBox(height: 10),
                                      pw.Text("Adresse aliexpress: " +
                                          productGagnantList.siteAliexpress),
                                      pw.SizedBox(height: 10),
                                      pw.Divider(),
                                    ]),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    mainAxisSize: pw.MainAxisSize.min,
                                    children: [
                                      pw.SizedBox(height: 50),
                                      pw.Image(pw.MemoryImage(patch),
                                          height: 200,
                                          fit: pw.BoxFit.fitHeight),
                                      pw.SizedBox(height: 30),
                                      pw.Image(pw.MemoryImage(patch1),
                                          height: 200,
                                          fit: pw.BoxFit.fitHeight),
                                    ]),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    mainAxisSize: pw.MainAxisSize.min,
                                    children: [
                                      pw.SizedBox(height: 50),
                                      pw.Image(pw.MemoryImage(patch2),
                                          height: 250,
                                          fit: pw.BoxFit.fitHeight),
                                      pw.SizedBox(height: 30),
                                      statOffre
                                          ? pw.SizedBox(height: 2)
                                          : pw.Image(pw.MemoryImage(patch3),
                                              height: 250,
                                              fit: pw.BoxFit.fitHeight),
                                    ])
                              ];
                            }));

                        final output = await getTemporaryDirectory();
                        final file = File("${output.path}/easydrop.pdf");
                        await file.writeAsBytes(await pdf.save()); //
                        Share.shareFiles(["${output.path}/easydrop.pdf"],
                            text: 'Great picture');
                      },
                      child: Icon(
                        Icons.picture_as_pdf,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ), // icon
                    Text(
                      "Pdf",
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ), // text
                  ],
                ),
              ),
            ],
            title: Text("Partages", style: TextStyle(color: Colors.black)),
            centerTitle: true,
            flexibleSpace: Container(
              height: 140,
              padding: EdgeInsets.only(top: 20.0, right: 30.0),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 140,
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
        child: ListView(
          children: [
            Image(image: MemoryImage(patch, scale: 0.5)),
            Image(image: MemoryImage(patch1, scale: 0.5)),
            Image(image: MemoryImage(patch2, scale: 0.5)),
            statOffre
                ? SizedBox(height: 2)
                : Image(image: MemoryImage(patch3, scale: 0.5)),
          ],
        ),
      ),
    );
  }
}
