import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/registration/password_screen.dart';
import 'package:we_help/screens/registration/registration.dart';

class EmailScreen extends StatelessWidget {
  static String _email;

  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    final registrationState =
        Provider.of<RegistrationState>(context, listen: false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _titleText(appTheme),
          _emailInputField(appTheme),
          _nextButton(context, registrationState),
        ],
      ),
    );
  }

  Widget _titleText(ThemeData theme) {
    return Center(
        child: Text("Введите почту",
            style: theme.textTheme.headline2, textAlign: TextAlign.center));
  }

  Widget _nextButton(
      BuildContext context, RegistrationState registrationState) {
    return RoundedButton(
      text: "Далее",
      press: () {
        registrationState.email = _email;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PasswordScreen();
            },
          ),
        );
      },
    );
  }

  Widget _emailInputField(ThemeData theme) {
    return StandardInputField(
      color: theme.primaryColor,
      hintText: "example@gmail.com",
      onChanged: (value) {
        _email = value;
      },
    );
  }
}
