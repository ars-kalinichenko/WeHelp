import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/Registration/password_screen.dart';

class EmailScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _code;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Text("Введите почту",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center)),
          StandardInputField(
            color: Theme.of(context).primaryColor,
            hintText: "example@gmail.com",
            onChanged: (value) {
              print(value);
            },
          ),
          RoundedGradientButton(
              text: "Далее",
              color: Colors.transparent,
              textColor: Theme
                  .of(context)
                  .primaryColor,
              press: () {
                print(_code);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PasswordScreen();
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
