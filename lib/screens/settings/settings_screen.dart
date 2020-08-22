import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/profile_information_input.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/models/private_user.dart';
import 'package:we_help/repository/auth.dart';
import 'package:we_help/screens/welcome/welcome_screen.dart';
import 'package:we_help/services/rest_api.dart';

class SettingsScreen extends StatelessWidget {
  final PrivateUser privateUser;

  SettingsScreen({Key key, @required this.privateUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top: screenHeight * 0.05),
          children: <Widget>[
            _backButton(context),
            _photo(screenHeight),
            SizedBox(height: screenHeight * 0.03),
            _nameText(context, screenHeight, screenWidth, theme),
            SizedBox(height: screenHeight * 0.05),
            _aboutUser(theme, screenHeight, screenWidth, privateUser.aboutMe,
                    (value) {
                  privateUser.aboutMe = value;
                }),
            SizedBox(height: screenHeight * 0.03),
            _userEducation(theme, screenHeight, screenWidth,
                privateUser.educationDescription,
                    (value) {
                  privateUser.educationDescription = value;
                }),
            SizedBox(height: screenHeight * 0.05),
//            _emailFiled(screenHeight, screenWidth),
//            SizedBox(height: screenHeight * 0.05),
//            _passwordField(screenHeight, screenWidth),
//            SizedBox(height: screenHeight * 0.05),
            _saveButton(context, screenWidth),
            SizedBox(height: screenHeight * 0.03),
            _logOutButton(context, screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(LogInIcons.back_arrow_icon),
        iconSize: 40.0,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _photo(double screenHeight) {
    return CircleAvatar(
      backgroundColor: RandomColor().randomColor(
        colorBrightness: ColorBrightness.light,
      ),
      foregroundColor: Colors.black,
      child: Text(
        privateUser.name[0],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),
      radius: screenHeight * 0.09,
    );
  }

  Widget _nameText(BuildContext context, double screenHeight,
      double screenWidth, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _nameInputTile(screenWidth, theme, privateUser.name, (value) {
            privateUser.name = value;
          }),
          _nameInputTile(screenWidth, theme, privateUser.surname, (value) {
            privateUser.surname = value;
          }),
        ],
      ),
    );
  }

  Widget _nameInputTile(double screenWidth, ThemeData theme, String initText,
      Function func) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: screenWidth * 0.3, maxWidth: screenWidth * 0.5),
      child: TextFormField(
        decoration: new InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none),
        initialValue: initText,
        textAlign: TextAlign.center,
        style: theme.textTheme.headline2
            .copyWith(decoration: TextDecoration.underline),
        onChanged: func,
      ),
    );
  }

  Widget _aboutUser(ThemeData theme, double screenHeight, double screenWidth,
      String userDescription, Function func) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.07,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "О себе",
            style: TextStyle(fontSize: 24, color: Color(0xff3F3D56)),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          TextFormField(
            decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none),
            initialValue: userDescription,
            textAlign: TextAlign.left,
            onChanged: func,
            style: theme.textTheme.headline5,
          ),
        ],
      ),
    );
  }

  Widget _userEducation(ThemeData theme, double screenHeight,
      double screenWidth,
      String userEducation, Function func) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.07,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Образование",
            style: TextStyle(fontSize: 24, color: Color(0xff3F3D56)),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          TextFormField(
            decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none),
            initialValue: userEducation,
            textAlign: TextAlign.left,
            onChanged: func,
            style: theme.textTheme.headline5,
          ),
        ],
      ),
    );
  }

  Widget _emailFiled(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Электронная почта",
            style: TextStyle(fontSize: 24, color: Color(0xff3F3D56)),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          ProfileInputField(
            hintText: "Введите почту",
            initText: "chukr@yandex.ru",
          )
        ],
      ),
    );
  }

  Widget _passwordField(double screenHeight, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Изменить пароль",
            style: TextStyle(fontSize: 24, color: Color(0xff3F3D56)),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          ProfileInputField(
            hintText: "Введите пароль",
            obscure: true,
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          ProfileInputField(
            hintText: "Повторите пароль",
            obscure: true,
          ),
        ],
      ),
    );
  }

  Widget _saveButton(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
      child: RoundedButton(
        text: "Сохранить",
        press: () async {
          await RestApi.changeUserInfo(privateUser.toJson());
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _logOutButton(BuildContext context, double screenWidth,
      double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight * 0.07,
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Color(0xffF14E4E), width: 2.5),
          ),
          color: Colors.transparent,
          splashColor: Colors.transparent,
          child: Text(
            "Выйти из аккаунта",
            style: TextStyle(color: Color(0xffF14E4E), fontSize: 18),
          ),
          onPressed: () {
            AuthRepository.logOut();
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return WelcomeScreen();
                }), (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
