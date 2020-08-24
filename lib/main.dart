import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/repository/auth.dart';
import 'package:we_help/screens/main_page.dart';
import 'package:we_help/screens/registration/registration.dart';
import 'package:we_help/screens/welcome/welcome_screen.dart';
import 'package:we_help/services/rest_api.dart';

import 'themes/app_theme.dart';

void main() {
  runApp(WeHelp());
}

class WeHelp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => RegistrationState(),
        child: MaterialApp(
            title: 'WeHelp',
            debugShowCheckedModeBanner: false,
            theme: appLightTheme,
            home: WeHelpAuth()));
  }
}

class WeHelpAuth extends StatefulWidget {
  WeHelpAuth({Key key}) : super(key: key);

  @override
  _WeHelpAuthState createState() => _WeHelpAuthState();
}

class _WeHelpAuthState extends State<WeHelpAuth> {
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _validateLogIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        Widget childWidget;

        if (snapshot.data == true) {
          childWidget = MainPage();
        }
        else {
          childWidget = WelcomeScreen();
        }
        return childWidget;
      },
    );
  }

  static Future<bool> _isLogIn() async {
    return await AuthRepository.isLogIn();
  }

  static Future<bool> _validateLogIn() async {
    bool isLogIn = await _isLogIn();
    if (!isLogIn) {
      return false;
    } else if (await _pushAuthData()) {
      print("The user is authenticated.");
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> _pushAuthData() async {
    String login = await AuthRepository.getLogin();
    String password = await AuthRepository.getPassword();
    try {
      String key = await RestApi.logInUser(login, password);
      AuthRepository.setKey(key);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
