import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/registration/registration.dart';

import 'name_screen.dart';

class PasswordScreen extends StatelessWidget {
  static String _password;
  static String _passwordConfirm;

  @override
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
          _passwordInputFields(appTheme),
          _nextButton(context, registrationState),
        ],
      ),
    );
  }

  Widget _titleText(ThemeData theme) {
    return Center(
      child: Text(
        "Задайте пароль",
        style: theme.textTheme.headline2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _passwordInputFields(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        StandardInputField(
          color: theme.primaryColor,
          obscure: true,
          hintText: "Введите пароль",
          onChanged: (value) {
            _password = value;
          },
        ),
        SizedBox(height: 20),
        StandardInputField(
          color: theme.primaryColor,
          obscure: true,
          hintText: "Повторите пароль",
          onChanged: (value) {
            _passwordConfirm = value;
          },
        ),
      ],
    );
  }

  Widget _nextButton(
      BuildContext context, RegistrationState registrationState) {
    return RoundedButton(
      text: "Продолжить",
      press: () {
        registrationState.password = _password;
        registrationState.passwordConfirm = _passwordConfirm;
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
    );
  }
}
