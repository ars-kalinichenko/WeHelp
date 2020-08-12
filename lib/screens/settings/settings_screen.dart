import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/icons.dart';
import 'package:we_help/components/profile_information_input.dart';
import 'package:we_help/components/rounded_button.dart';

class SettingsScreen extends StatelessWidget {
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
            _settingsButton(context),
            _photo(screenHeight),
            SizedBox(height: screenHeight * 0.03),
            _nameText(context, screenHeight, screenWidth, theme),
            SizedBox(height: screenHeight * 0.05),
            _aboutUser(screenHeight, screenWidth),
            SizedBox(height: screenHeight * 0.05),
            _emailFiled(screenHeight, screenWidth),
            SizedBox(height: screenHeight * 0.05),
            _passwordField(screenHeight, screenWidth),
            SizedBox(height: screenHeight * 0.05),
            _saveButton(screenWidth),
            SizedBox(height: screenHeight * 0.07),
            _deleteButton(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _settingsButton(BuildContext context) {
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
      child: ClipOval(
        child: SizedBox(
          height: screenHeight * 0.2,
          width: screenHeight * 0.2,
          child: Image(
            image: AssetImage("assets/images/ori.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      radius: screenHeight * 0.105,
    );
  }

  Widget _nameText(BuildContext context, double screenHeight,
      double screenWidth, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _nameInputTile(screenWidth, theme, "Константин"),
          _nameInputTile(screenWidth, theme, "Чукреев"),
        ],
      ),
    );
  }

  Widget _nameInputTile(double screenWidth, ThemeData theme, String initText) {
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
      ),
    );
  }

  Widget _aboutUser(double screenHeight, double screenWidth) {
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
          Text(
            """Я веселый и жизнелюбивый гражданин. Люблю печь печенье, людей, кроликов, кошек, собачек и зефир. Работаю программистом. Вяжу. 

Готов помочь всем и каждому, чем смогу помогу. Не стесняйся писать и спрашивать если есть какие-то вопросы, даже странные, но не очень. Всем добра и печенья.""",
            style: TextStyle(fontSize: 18),
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

  Widget _saveButton(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
      child: RoundedButton(
        text: "Сохранить",
        press: () {},
      ),
    );
  }

  Widget _deleteButton(double screenWidth, double screenHeight) {
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
          onPressed: () {},
          child: Text(
            "Выйти из аккаунта",
            style: TextStyle(color: Color(0xffF14E4E), fontSize: 18),
          ),
        ),
      ),
    );
  }
}
