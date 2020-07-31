import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_gradient_button.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Text("Туть скоро будет главный экран",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center)),
          RoundedGradientButton(
              text: "Скушать печеньку",
              color: Colors.transparent,
              textColor: Theme.of(context).primaryColor,
              press: () {
                print("Печеньки!");
              })
        ],
      ),
    );
  }
}
