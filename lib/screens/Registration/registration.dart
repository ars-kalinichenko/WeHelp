import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/screens/Registration/phone_screen.dart';

class Registration {
  final BuildContext context;

  const Registration(this.context);

  void startRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PhoneScreen();
        },
      ),
    );
  }
}

class RegistrationState {
  String phoneNumber;
  String email;
  String password;
  String passwordConfirm;
  String name;
  String surname;

  RegistrationState(
      {this.phoneNumber,
      this.email,
      this.password,
      this.passwordConfirm,
      this.name,
      this.surname});

  Map<String, dynamic> getValues() {
    return {
      "phone": this.phoneNumber,
      "email": this.email,
      "password1": this.password,
      "password2": this.passwordConfirm,
      "name": this.name,
      "surname": this.surname
    };
  }
}
