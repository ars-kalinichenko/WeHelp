import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/phone_input_field.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/screens/registration/email_screen.dart';
import 'package:we_help/screens/registration/registration.dart';
import 'package:we_help/services/text_processing.dart';
import 'package:we_help/services/validator.dart';

class PhoneScreen extends StatelessWidget {
  static String _phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    final registrationState =
        Provider.of<RegistrationState>(context, listen: false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _titleText(appTheme),
          _phoneInputField(appTheme),
          _nextButton(context, registrationState),
        ],
      ),
    );
  }

  Widget _titleText(ThemeData theme) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "Введите номер \nтелефона",
        textAlign: TextAlign.center,
        style: theme.textTheme.headline2,
      ),
    );
  }

  Widget _phoneInputField(ThemeData theme) {
    return PhoneInputField(
      color: theme.primaryColor,
      onChanged: (value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _nextButton(
      BuildContext context, RegistrationState registrationState) {
    return RoundedButton(
      text: "Продолжить",
      press: () {
        String _phoneWithoutMask = deleteMask(RegExp("[^0-9,+]"), _phoneNumber);
        if (validateNumber(_phoneWithoutMask)) {
          registrationState.phoneNumber = _phoneWithoutMask;
          print(registrationState.phoneNumber);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EmailScreen();
              },
            ),
          );
        }
      },
    );
  }
}
