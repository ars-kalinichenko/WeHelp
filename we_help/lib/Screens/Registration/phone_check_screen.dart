import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneCheckScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 70),
          Center(
              child: Text("Введите код",
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center))
        ],
      ),
    );
  }
}
