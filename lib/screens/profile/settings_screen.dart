import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget _deleteButton(double screenWidth, double screenHeight) {
  return Container(
    width: screenWidth * 0.66,
    height: screenHeight * 0.07,
    child: FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Color(0xff00C6FF), width: 2.5),
      ),
      color: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () {},
      child: Text(
        "Выйти из аккаунта",
        style: TextStyle(color: Colors.amberAccent, fontSize: 18),
      ),
    ),
  );
}
