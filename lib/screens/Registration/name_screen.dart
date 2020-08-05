import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/Registration/registration.dart';

class NameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _name;
    String _surname;
    double sizeHeight = MediaQuery.of(context).size.height;

    final registrationState =
        Provider.of<RegistrationState>(context, listen: false);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Text("Как вас зовут?",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center)),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StandardInputField(
                  color: Theme.of(context).primaryColor,
                  keyboardMode: TextCapitalization.words,
                  hintText: "Фамилия",
                  onChanged: (value) {
                    _name = value;
                  },
                ),
                SizedBox(height: sizeHeight*0.02),
                StandardInputField(
                  color: Theme.of(context).primaryColor,
                  keyboardMode: TextCapitalization.words,
                  hintText: "Имя",
                  onChanged: (value) {
                    _surname = value;
                  },
                ),
              ]),
          RoundedButton(
              text: "Далее",
              color: Colors.transparent,
              textColor: Color(0xff00C6FF),
              press: () {
                registrationState.name = _name;
                registrationState.surname = _surname;
                Registration.pushRegistration(
                    context, registrationState.getValues());
              })
        ],
      ),
    );
  }
}
