import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/code_input_field.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/screens/registration/email_screen.dart';
import 'package:we_help/services/validator.dart';

class PhoneCheckScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _code = "";
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Text("Введите код",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center)),
          CodeInputField(
            color: Theme.of(context).primaryColor,
            onChanged: (value) {
              _code = value;
            },
          ),
          RoundedButton(
              text: "Продолжить",
              color: Colors.transparent,
              textColor: Theme.of(context).accentColor,
              press: () {
                print(_code);
                if (validateCode(_code))
                  Navigator.pushReplacement(
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
