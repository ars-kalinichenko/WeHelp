import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/Registration/name_screen.dart';

class PasswordScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _password;
    String _passwordConfirm;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Text("Задайте пароль",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              StandardInputField(
                color: Theme.of(context).primaryColor,
                obscure: true,
                hintText: "Введите пароль",
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 20),
              StandardInputField(
                color: Theme.of(context).primaryColor,
                obscure: true,
                hintText: "Повторите пароль",
                onChanged: (value) {
                  _passwordConfirm = value;
                },
              ),
            ],
          ),
          RoundedGradientButton(
              text: "Продолжить",
              color: Colors.transparent,
              textColor: Theme.of(context).primaryColor,
              press: () {
                print("Password: $_password, confirm: $_passwordConfirm");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NameScreen();
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
