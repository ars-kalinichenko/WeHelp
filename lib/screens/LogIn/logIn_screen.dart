import 'package:flutter/material.dart';
import 'package:we_help/components/custom_toast.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/services/rest_api.dart';

import '../main_page.dart';

class LogInScreen extends StatelessWidget {
  static String _login;
  static String _password;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.11,
                  left: screenWeight * 0.1,
                  right: screenWeight * 0.1),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(LogInIcons.back_arrow_icon),
                      iconSize: 40.0,
                      onPressed: () => Navigator.of(context).pop()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Text("Вход",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.07,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Имя пользователя"),
                StandardInputField(
                  color: Theme.of(context).primaryColor,
                  hintText: "example@gmail.com",
                  onChanged: (value) {
                    _login = value;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                Text("Пароль"),
                StandardInputField(
                  color: Theme.of(context).primaryColor,
                  obscure: true,
                  hintText: "Введите пароль",
                  onChanged: (value) {
                    _password = value;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Text("Войти через соц.сеть"),
                SizedBox(height: screenHeight * 0.02),
                Row(
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
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.07),
            RoundedButton(
                text: "Войти",
                press: () {
                  logIn(context);
                }),
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
}
