import 'package:flutter/material.dart';
import 'package:we_help/components/custom_toast.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/rounded_gradient_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/screens/main_page.dart';
import 'package:we_help/services/rest_api.dart';

class LogInScreen extends StatelessWidget {
  static String _login;
  static String _password;

  static void logIn(BuildContext context) async {
    Map<String, String> data = {"email": _login, "password": _password};
    print(data);
    try {
      await RestApi.logInUser(data);
      ToastUtils.showCustomToast(
          context,
          "Все верно!",
          Icon(Icons.check, color: Colors.white),
          Colors.white,
          Color(0xff3EE896));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainPage();
      }));
    } catch (e) {
      print(e.toString());
      ToastUtils.showCustomToast(
          context,
          "Попробуйте ещё раз.",
          Icon(Icons.clear, color: Colors.white),
          Colors.white,
          Color(0xffF14E4E));
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWeight = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  top: sizeHeight * 0.11,
                  left: sizeWeight * 0.1,
                          right: sizeWeight * 0.1),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(LogInIcons.eva_arrow_ios_back_fill),
                              iconSize: 40.0,
                              onPressed: () => Navigator.of(context).pop()),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: Text("Вход",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline2),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: sizeHeight*0.07,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Имя пользователя"),
                      StandardInputField(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          hintText: "example@gmail.com",
                          onChanged: (value) {
                            _login = value;
                          }),
                      SizedBox(height: sizeHeight * 0.07),
                      Text("Пароль"),
                      StandardInputField(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        obscure: true,
                        hintText: "Введите пароль",
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: sizeHeight * 0.1),
                      Text("Войти через соц.сеть"),
                      SizedBox(height: sizeHeight * 0.02),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(LogInIcons.bx_bxl_vk, size: 40),
                          SizedBox(width: sizeWeight * 0.08),
                          Icon(LogInIcons.ant_design_google_outlined, size: 40),
                          SizedBox(width: sizeWeight * 0.08),
                          Icon(LogInIcons.dashicons_facebook_alt, size: 40),
                          SizedBox(width: sizeWeight * 0.08),
                          Icon(LogInIcons.bx_bxl_linkedin, size: 40)
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: sizeHeight * 0.07),
                  RoundedGradientButton(
                      text: "Войти",
                      color: Colors.transparent,
                      press: () {
                        logIn(context);
                      }),
                  SizedBox(height: sizeHeight * 0.07)
                ])));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
