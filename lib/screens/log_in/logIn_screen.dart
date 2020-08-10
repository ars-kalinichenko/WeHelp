import 'package:flutter/material.dart';
import 'package:we_help/components/custom_toast.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/components/title_with_back_arrow.dart';
import 'package:we_help/services/rest_api.dart';

import '../main_page.dart';

class LogInScreen extends StatelessWidget {
  static String _login;
  static String _password;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    ThemeData appTheme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: screenHeight * 0.11,
            left: screenWeight * 0.1,
            right: screenWeight * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            titleWithBackArrow(appTheme, context, "Вход"),
            SizedBox(
              height: screenHeight * 0.07,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Имя пользователя"),
                _emailInputField(appTheme),
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                Text("Пароль"),
                _passwordInputField(appTheme),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Text("Войти через соц.сеть"),
                SizedBox(height: screenHeight * 0.02),
                _socialNetworksAuth(screenWeight),
              ],
            ),
            SizedBox(height: screenHeight * 0.07),
            _logInButton(context),
            SizedBox(height: screenHeight * 0.07),
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  static void logIn(BuildContext context) async {
    Map<String, String> data = {"email": _login, "password": _password};
    print(data);
    try {
      await RestApi.logInUser(data);
      ToastUtils.showSuccessToast(context);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return MainPage();
          }), (Route<dynamic> route) => false);
    } catch (e) {
      print(e.toString());
      ToastUtils.showErrorToast(context);
    }
  }

  Widget _emailInputField(ThemeData theme) {
    return StandardInputField(
      color: theme.primaryColor,
      hintText: "example@gmail.com",
      onChanged: (value) {
        _login = value;
      },
    );
  }

  Widget _passwordInputField(ThemeData theme) {
    return StandardInputField(
      color: theme.primaryColor,
      obscure: true,
      hintText: "Введите пароль",
      onChanged: (value) {
        _password = value;
      },
    );
  }

  Widget _socialNetworksAuth(double screenWeight) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(LogInIcons.vk_icon, size: 40),
        SizedBox(width: screenWeight * 0.08),
        Icon(LogInIcons.google_icon, size: 40),
        SizedBox(width: screenWeight * 0.08),
        Icon(LogInIcons.facebook_icon, size: 40),
        SizedBox(width: screenWeight * 0.08),
        Icon(LogInIcons.linkedIn_icon, size: 40)
      ],
    );
  }

  Widget _logInButton(BuildContext context) {
    return RoundedButton(
      text: "Войти",
      press: () {
        logIn(context);
      },
    );
  }
}
