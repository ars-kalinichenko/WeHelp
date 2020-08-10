import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/registration/registration.dart';

import 'name_screen.dart';

class PasswordScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String password;
    String passwordConfirm;
    ThemeData appTheme = Theme.of(context);
    final registrationState =
        Provider.of<RegistrationState>(context, listen: false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Text("Задайте пароль",
                  style: appTheme.textTheme.headline2,
                  textAlign: TextAlign.center)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              StandardInputField(
                color: appTheme.primaryColor,
                obscure: true,
                hintText: "Введите пароль",
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 20),
              StandardInputField(
                color: appTheme.primaryColor,
                obscure: true,
                hintText: "Повторите пароль",
                onChanged: (value) {
                  passwordConfirm = value;
                },
              ),
            ],
          ),
          RoundedButton(
            text: "Продолжить",
            press: () {
              registrationState.password = password;
              registrationState.passwordConfirm = passwordConfirm;
              print("Password: ${registrationState.password}");

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NameScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
