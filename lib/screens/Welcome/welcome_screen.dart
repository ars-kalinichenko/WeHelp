import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/text_button.dart';
import 'package:we_help/screens//PrivacyPolicy/privacy_screen.dart';
import 'package:we_help/screens//Registration/registration.dart';
import 'package:we_help/screens/LogIn/logIn_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
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
                    style: Theme.of(context).textTheme.headline3),
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
                        color: Colors.transparent,
                        textColor: Theme.of(context).primaryColor),
                    SizedBox(height: sizeHeight * 0.03),
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
                      fontSize: Theme
                          .of(context)
                          .textTheme
                          .headline6
                          .fontSize,
                      fontFamily:
                      Theme
                          .of(context)
                          .textTheme
                          .headline6
                          .fontFamily,
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
                    )
                  ]))
        ])));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
