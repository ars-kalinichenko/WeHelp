import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/search_field.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWeight = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(left: sizeWeight * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: sizeHeight * 0.03),
          Container(
              height: sizeHeight * 0.17,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  //TODO: add tips
                ],
              )),
          SearchInputField(
            width: 0.87,
            hintText: "Ваш вопрос...",
          ),
          SizedBox(height: sizeHeight * 0.03),
          Text(
            "Актуальное для тебя",
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    ));
  }
}
