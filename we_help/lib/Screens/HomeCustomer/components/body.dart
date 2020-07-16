import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/rounded_input_field.dart';

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
        body: Column(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 35, left: 20),
            child: IconButton(
              icon: Icon(Icons.menu),
              iconSize: 30,
              color: Colors.black,
              splashColor: Colors.transparent,
              onPressed: () {
                log("Opening menu");
              },
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 50, left: 30),
                  child: Text('Сотни людей уже \nготовы помочь вам',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: HeadersFontSize,
                          fontFamily: PrimaryFontFamily)),
                ),
                SizedBox(height: 40.0),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Text('Опишите вашу проблему \nв 5 - 10 словах',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: TextFontSize,
                          fontFamily: PrimaryFontFamily)),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 50, left: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RoundedInputField(
                        hintText: "Не могу побороть лень",
                        icon: Icons.all_inclusive),
                    SizedBox(height: 10),
                    RoundedButton(
                      text: "Найти",
                      press: () {
                        log("Searching: ...");
                      },
                    ),
                  ])),
        ]));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
