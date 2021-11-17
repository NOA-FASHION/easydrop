import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PlayPicture extends StatelessWidget {
  final Uint8List patch;
  final Directory directory;
  const PlayPicture({Key? key, required this.patch, required this.directory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pdf = pw.Document();
    // final image = Image(image: MemoryImage(patch, scale: 0.5));
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
                        Share.shareFiles(
                            ['${directory.path}/container_image.png'],
                            text: 'Great picture');
                      },
                      child: Icon(
                        Icons.picture_in_picture,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ), // icon
                    Text(
                      "Pictures",
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ), // text
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      splashColor: Colors.white,
                      onTap: () async {
                        pdf.addPage(pw.Page(build: (pw.Context context) {
                          return pw.Center(
                            child: pw.Image(pw.MemoryImage(patch)),
                          ); // Center
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
            title: Text("Images"),
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
          ],
        ),
      ),
    );
  }
}
