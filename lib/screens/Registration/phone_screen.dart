import 'package:flutter/material.dart';
import 'package:we_help/components/phone_input_field.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/screens/Registration/phone_check_screen.dart';
import 'package:we_help/services/text_processing.dart';
import 'package:we_help/services/validator.dart';

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
                if (validateNumber(_phoneNumber)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PhoneCheckScreen();
                      },
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
