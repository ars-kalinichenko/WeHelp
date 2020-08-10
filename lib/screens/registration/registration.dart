import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/custom_toast.dart';
import 'package:we_help/screens/LogIn/logIn_screen.dart';
import 'package:we_help/screens/registration/phone_screen.dart';
import 'package:we_help/services/rest_api.dart';

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

  static void pushRegistration(
      BuildContext context, Map<String, dynamic> data) async {
    try {
      await RestApi.registerUser(data);
      ToastUtils.showSuccessToast(context);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return LogInScreen();
      }), (Route<dynamic> route) => false);
    } catch (e) {
      ToastUtils.showErrorToast(context);
      print(e.toString());
    }
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
      "email": this.email,
      "phone_number": this.phoneNumber,
      "name": this.name,
      "surname": this.surname,
      "password1": this.password,
      "password2": this.passwordConfirm,
    };
  }
}
