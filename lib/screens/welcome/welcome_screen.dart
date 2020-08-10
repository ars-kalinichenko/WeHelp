import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/text_button.dart';
import 'package:we_help/screens/log_in/logIn_screen.dart';
import 'package:we_help/screens/privacy_policy/privacy_screen.dart';
import 'package:we_help/screens/registration/registration.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    TextStyle headlineStyle = Theme.of(context).textTheme.headline4;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _titleText(context, screenHeight, theme),
            Column(
              children: <Widget>[
                _logInButton(context),
                SizedBox(height: screenHeight * 0.02),
                _registrationButton(theme, context),
              ],
            ),
            _privacyPolicyButton(context),
          ],
        ),
      ),
    );
  }

  Widget _titleText(
      BuildContext context, double screenHeight, ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: screenHeight * 0.15),
        Text('WeHelp',
            textAlign: TextAlign.center, style: theme.textTheme.headline1),
        SizedBox(height: screenHeight * 0.1),
        Text('Решение есть',
            textAlign: TextAlign.center, style: theme.textTheme.headline2),
      ],
    );
  }

  Widget _logInButton(BuildContext context) {
    return RoundedButton(
      text: "Войти",
      width: 0.65,
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LogInScreen();
            },
          ),
        );
      },
    );
  }

  Widget _registrationButton(ThemeData appTheme, BuildContext context) {
    return TextButton(
      text: "Зарегистрироваться",
      textStyle: TextStyle(
        color: appTheme.textTheme.headline4.color,
        fontSize: appTheme.textTheme.headline4.fontSize,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.underline,
      ),
      onPressed: () {
        Registration(context).startRegistration();
      },
    );
  }

  Widget _privacyPolicyButton(BuildContext context) {
    return TextButton(
      text: "Политика конфиденциальности",
      textStyle: TextStyle(
        color: Colors.black26,
        fontSize: 16,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PrivacyScreen();
            },
          ),
        );
      },
    );
  }
}
