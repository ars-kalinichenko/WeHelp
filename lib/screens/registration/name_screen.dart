import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/registration/registration.dart';

class NameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String name;
    String surname;
    ThemeData appTheme = Theme.of(context);
    double screenHeight = MediaQuery.of(context).size.height;

    final registrationState =
        Provider.of<RegistrationState>(context, listen: false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _titleText(appTheme),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StandardInputField(
                color: appTheme.primaryColor,
                keyboardMode: TextCapitalization.words,
                hintText: "Фамилия",
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              StandardInputField(
                color: appTheme.primaryColor,
                keyboardMode: TextCapitalization.words,
                hintText: "Имя",
                onChanged: (value) {
                  surname = value;
                },
              ),
            ],
          ),
          RoundedButton(
            text: "Далее",
            press: () {
              registrationState.name = name;
              registrationState.surname = surname;
              Registration.pushRegistration(
                context,
                registrationState.getValues(),
              );
            },
          ),
        ],
      ),
    );
  }
  Widget _titleText(ThemeData theme){
    return Center(
      child: Text(
        "Как вас зовут?",
        style: theme.textTheme.headline2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
