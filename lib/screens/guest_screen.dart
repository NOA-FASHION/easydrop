import 'package:easydrop/controllers/challenge_controller.dart';
import 'package:easydrop/screens/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class GuestScreen extends StatefulWidget {
  GuestScreen({Key? key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Challengecontroller _userDrop = Provider.of<Challengecontroller>(context);

    return Container(
      child: _userDrop.getInfoRecupere() ? HomeScreen() : SignupFormPage(),
    );
  }
}
