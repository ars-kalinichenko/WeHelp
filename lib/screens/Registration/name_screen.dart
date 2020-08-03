import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/LogIn/logIn_screen.dart';
import 'package:we_help/screens/Registration/registration.dart';

class NameScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    String _name;
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
          StandardInputField(
            color: Theme.of(context).primaryColor,
            keyboardMode: TextCapitalization.words,
            hintText: "Фамилия Имя",
            onChanged: (value) {
              _name = value;
            },
          ),

          RoundedGradientButton(
              text: "Далее",
              color: Colors.transparent,
              textColor: Theme.of(context).primaryColor,
              press: () {
                registrationState.name = _name;
                print(registrationState.name);
                print(registrationState.getValues());
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                      return LogInScreen();
                    }), (Route<dynamic> route) => true);
              })
        ],
      ),
    );
  }
}
