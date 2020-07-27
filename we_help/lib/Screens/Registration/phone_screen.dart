import 'package:flutter/material.dart';
import 'package:we_help/Screens/Registration/phone_check_screen.dart';
import 'package:we_help/components/phone_input_field.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/services/text_processing.dart';

class PhoneScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _phoneNumber = "";

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Text(
                "Введите номер \nтелефона",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              )),
          PhoneInputField(
            color: Theme.of(context).primaryColor,
            onChanged: (value) {
              _phoneNumber = deleteMask(RegExp("[^0-9,+]"), value);
            },
          ),
          RoundedGradientButton(
              text: "Продолжить",
              color: Colors.transparent,
              textColor: Theme.of(context).primaryColor,
              press: () {
                print(_phoneNumber);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PhoneCheckScreen();
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
