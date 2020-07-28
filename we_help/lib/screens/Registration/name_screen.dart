import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/simple_input_filed.dart';

class NameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _name;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Text("Как вас зовут?",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center)),

          SimpleInputField(
            color: Theme
                .of(context)
                .primaryColor,
            keyboardMode: TextCapitalization.words,
            hintText: "Фамилия Имя",
            onChanged: (value) {
              print(value);
            },
          ),

          RoundedGradientButton(
              text: "Далее",
              color: Colors.transparent,
              textColor: Theme
                  .of(context)
                  .primaryColor,
              press: () {
                print(_name);
              })
        ],
      ),
    );
  }
}
