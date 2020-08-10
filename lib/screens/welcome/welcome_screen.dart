import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/text_button.dart';
import 'package:we_help/screens//PrivacyPolicy/privacy_screen.dart';
import 'package:we_help/screens/LogIn/logIn_screen.dart';
import 'package:we_help/screens/registration/registration.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.15),
                  child: Text('WeHelp',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1),
                ),
                SizedBox(height: screenHeight * 0.1),
                Text('Решение есть',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 45.0, right: 45.0, top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RoundedButton(
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
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextButton(
                          text: "Зарегистрироваться",
                          textColor:
                              Theme.of(context).textTheme.headline4.color,
                          fontSize:
                              Theme.of(context).textTheme.headline4.fontSize,
                          fontFamily:
                              Theme.of(context).textTheme.headline4.fontFamily,
                          fontWeight: FontWeight.w600,
                          underline: true,
                          onPressed: () {
                            Registration(context).startRegistration();
                          }),
                      SizedBox(height: screenHeight * 0.2),
                      TextButton(
                        text: "Политика конфиденциальности",
                        textColor: Colors.black26,
                        fontSize:
                            Theme.of(context).textTheme.headline6.fontSize,
                        fontFamily:
                            Theme.of(context).textTheme.headline6.fontFamily,
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
                      ),
                      SizedBox(height: screenHeight * 0.02)
                    ]))
          ],
        ),
      ),
    );
  }
}