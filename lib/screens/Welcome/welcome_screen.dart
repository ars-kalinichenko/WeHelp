import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/text_button.dart';
import 'package:we_help/screens//PrivacyPolicy/privacy_screen.dart';
import 'package:we_help/screens/LogIn/logIn_screen.dart';
import 'package:we_help/screens/Registration/registration.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;

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
              Container(
                padding: EdgeInsets.only(top: sizeHeight * 0.15),
                child: Text('WeHelp',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
              ),
              SizedBox(height: sizeHeight * 0.1),
              Container(
                child: Text('Решение есть',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(left: 45.0, right: 45.0, top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RoundedGradientButton(
                        text: "Войти",
                        width: 0.65,
                        textColor: Colors.white,
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
                        color: Colors.transparent),
                    SizedBox(height: sizeHeight * 0.02),
                    TextButton(
                        text: "Зарегистрироваться",
                        textColor: Theme.of(context).textTheme.headline4.color,
                        fontSize:
                            Theme.of(context).textTheme.headline4.fontSize,
                        fontFamily:
                            Theme.of(context).textTheme.headline4.fontFamily,
                        fontWeight: FontWeight.w600,
                        underline: true,
                        onPressed: () {
                          Registration(context).startRegistration();
                        }),
                    SizedBox(height: sizeHeight * 0.2),
                    TextButton(
                      text: "Политика конфиденциальности",
                      textColor: Colors.black26,
                      fontSize: Theme.of(context).textTheme.headline6.fontSize,
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
                    SizedBox(height: sizeHeight * 0.02)
                  ]))
        ])));
  }
}
