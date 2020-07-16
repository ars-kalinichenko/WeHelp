import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:we_help/Screens/HomeCustomer/home_customer_screen.dart';
import 'package:we_help/Screens/PrivacyPolicy/privacy_screen.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 70),
                  child: Text('WeHelp',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28.0, fontFamily: PrimaryFontFamily)),
                ),
                SizedBox(height: 50.0),
                Container(
                  child: Text('Решение есть',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28.0, fontFamily: PrimaryFontFamily)),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 45.0, right: 45.0),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 50.0,
                      child: GestureDetector(
                        child: Material(
                          borderRadius: BorderRadius.only(
                              bottomRight: const Radius.circular(40.0)),
                          shadowColor: PrimaryColor,
                          color: PrimaryColor,
                          elevation: 7.0,
                          child: Center(
                            child: Text(
                              'Мне нужна помощь',
                              style: TextStyle(
                                  color: PrimaryColorLight,
                                  fontSize: 18,
                                  fontFamily: PrimaryFontFamily),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeCustomerScreen();
                              },
                            ),
                          );
                        },
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 50.0,
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: PrimaryColor,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                                bottomRight: const Radius.circular(40.0))),
                        child: Center(
                          child: Text(
                            "Я могу помочь",
                            style: TextStyle(
                                color: PrimaryColorMainText,
                                fontSize: 18,
                                fontFamily: PrimaryFontFamily),
                          ),
                        ),
                      ),
                      onTap: () {
                        log("Switches to worker screen"); //TODO: swipe screen
                      },
                    ),
                  )
                ],
              )),
          SizedBox(height: 30),
          Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: () {
                  log("Switches to privacy screen");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PrivacyScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  'Политика конфиденциальности',
                  style: TextStyle(
                      color: PrimaryColor,
                      fontSize: 16,
                      fontFamily: PrimaryFontFamily),
                ),
              ))
        ])));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
