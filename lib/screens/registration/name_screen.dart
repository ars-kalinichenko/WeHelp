import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/registration/registration.dart';

class NameScreen extends StatelessWidget {
  static String _name;
  static String _surname;

  Widget build(BuildContext context) {
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
          _nameInputFields(appTheme, screenHeight),
          _nextButton(context, registrationState),
        ],
      ),
    );
  }

  Widget _titleText(ThemeData theme) {
    return Center(
      child: Text(
        "Как вас зовут?",
        style: theme.textTheme.headline2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _nameInputFields(ThemeData theme, double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StandardInputField(
          color: theme.primaryColor,
          keyboardMode: TextCapitalization.words,
          hintText: "Фамилия",
          onChanged: (value) {
            _name = value;
          },
        ),
        SizedBox(height: screenHeight * 0.02),
        StandardInputField(
          color: theme.primaryColor,
          keyboardMode: TextCapitalization.words,
          hintText: "Имя",
          onChanged: (value) {
            _surname = value;
          },
        ),
      ],
    );
  }

  Widget _nextButton(
      BuildContext context, RegistrationState registrationState) {
    return RoundedButton(
      text: "Далее",
      press: () {
        registrationState.name = _name;
        registrationState.surname = _surname;
        Registration.pushRegistration(
          context,
          registrationState.getValues(),
        );
      },
    );
  }
}
