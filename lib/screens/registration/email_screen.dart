import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/registration/password_screen.dart';
import 'package:we_help/screens/registration/registration.dart';

class EmailScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _email;
    final registrationState =
        Provider.of<RegistrationState>(context, listen: false);

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
              _email = value;
            },
          ),
          RoundedButton(
            text: "Далее",
            press: () {
              registrationState.email = _email;
              print(registrationState.email);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PasswordScreen();
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
