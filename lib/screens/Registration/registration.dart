
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/screens/Registration/phone_screen.dart';

class Registration {
  final BuildContext context;

  const Registration(this.context);

  void startRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PhoneScreen();
        },
      ),
    );
  }
}
