import 'package:easydrop/screens/guest_screen.dart';
import 'package:easydrop/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/challenge_controller.dart';

void main() {
  runApp(Easydrop());
}

class Easydrop extends StatefulWidget {
  Easydrop({Key? key}) : super(key: key);

  @override
  _EasydropState createState() => _EasydropState();
}

class _EasydropState extends State<Easydrop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'ICanDoIt',
      home: ChangeNotifierProvider<Challengecontroller>(
          create: (context) => Challengecontroller(), child: GuestScreen()),
    );
  }
}
