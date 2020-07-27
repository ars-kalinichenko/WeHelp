import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/simple_input_filed.dart';

import 'email_screen.dart';

class PasswordScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _code;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Text("Задайте пароль",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center)),
          SimpleInputField(
            color: Theme.of(context).primaryColor,
            onChanged: (value) {
              print(value);
            },
          ),
          RoundedGradientButton(
              text: "Продолжить",
              color: Colors.transparent,
              textColor: Theme.of(context).primaryColor,
              press: () {
                print(_code);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EmailScreen();
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
