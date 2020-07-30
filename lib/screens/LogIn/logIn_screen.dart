import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/standard_input_filed.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWeight = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  top: sizeHeight * 0.11,
                  left: sizeWeight * 0.1,
                  right: sizeWeight * 0.1),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 32.0,
                      onPressed: () => Navigator.of(context).pop()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Text("Log In",
                          textAlign: TextAlign.center,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline2),
                    ),
                  ),
                ],
              )),
                  SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Имя пользователя"),
                      StandardInputField(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          hintText: "example@gmail.com"),
                      SizedBox(height: 10),
                      Text("Пароль"),
                      StandardInputField(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        obscure: true,
                        hintText: "Введите пароль",
                      ),
                      SizedBox(height: sizeHeight * 0.1),
                      Text("Войти через соц.сеть"),
                    ],
                  ),
                  Row(children: <Widget>[
                  ],),
                  SizedBox(height: 10),
                  RoundedGradientButton(text: "Войти",),
                  SizedBox(height: 10,)
                ])));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
