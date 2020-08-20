import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:we_help/components/question_preview.dart';
import 'package:we_help/examples.dart';
import 'package:we_help/models/private_user.dart';
import 'package:we_help/models/tag.dart';
import 'package:we_help/screens/settings/settings_screen.dart';
import 'package:we_help/services/rest_api.dart';

class ProfileScreen extends StatefulWidget {
  createState() => new _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    return FutureBuilder<PrivateUser>(
      future: RestApi.getUserInfo(),
      builder: (BuildContext context, AsyncSnapshot<PrivateUser> snapshot) {
        PrivateUser userInfo;
        if (snapshot.hasData) {
          userInfo = (snapshot.data);
        } else {
          userInfo = Examples.privateUserSample;
        }
        return Scaffold(
          body: Center(
            child: ListView(
              padding: EdgeInsets.only(top: screenHeight * 0.05),
              children: <Widget>[
                _settingsButton(context),
                _photo(screenHeight, userInfo.name),
                SizedBox(height: screenHeight * 0.03),
                _nameText(userInfo.name, userInfo.surname, screenHeight, theme),
                SizedBox(height: screenHeight * 0.05),
                _statistic(userInfo.answerCount, userInfo.questionCount,
                    userInfo.rating, screenWidth),
                SizedBox(height: screenHeight * 0.05),
                _aboutUser(screenHeight),
                SizedBox(height: screenHeight * 0.04),
                _tagRowColumn(userInfo.tags, screenWidth),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _settingsButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(
          Icons.settings,
          color: Color(0xff60626D),
          size: 24,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SettingsScreen();
              },
            ),
          );
        },
      ),
    );
  }

  Widget _photo(double screenHeight, String name) {
    return CircleAvatar(
      backgroundColor: RandomColor().randomColor(
        colorBrightness: ColorBrightness.light,
      ),
      foregroundColor: Colors.black,
      child: Text(
        name[0],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),
      radius: screenHeight * 0.09,
    );
  }

  Widget _nameText(
      String name, String surname, double screenHeight, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            name,
            textAlign: TextAlign.center,
            style: theme.textTheme.headline2,
          ),
          Text(
            surname,
            textAlign: TextAlign.center,
            style: theme.textTheme.headline2,
          ),
        ],
      ),
    );
  }

  Widget _statistic(
      int answerCount, int questionCount, double rating, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _statisticTile(
          Icons.message,
          "Ответов \nвопросы",
          answerCount.toString(),
          screenWidth,
        ),
        _statisticTile(
          Icons.whatshot,
          "Задано \nвопрсов",
          questionCount.toString(),
          screenWidth,
        ),
        _statisticTile(
          Icons.star_border,
          "Рейтинг \nпо ответам",
          rating.toString(),
          screenWidth,
        ),
      ],
    );
  }

  Widget _statisticTile(
      IconData icon, String tip, String value, double screenWidth) {
    Color tipsColor = Color(0xff60626D);
    Color focusColor = Color(0xff3F3D56);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: screenWidth * 0.07,
          color: tipsColor,
        ),
        Text(
          tip,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: tipsColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            color: focusColor,
          ),
        ),
      ],
    );
  }

  Widget _aboutUser(double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenHeight * 0.04, right: screenHeight * 0.04),
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
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _tagRowColumn(List<Tag> tagList, double screenWidth) {
    if(tagList == null)
      return SizedBox();
    int rowCount = tagList.length ~/ 4;
    List<Widget> rowWidgets = [];

    for (var i = 0; i < rowCount; i++) {
      rowWidgets.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: QuestionPreview.buildTagWidgets(
            screenWidth,
            tagList.sublist(0, 4),
          ),
        ),
      );
      rowWidgets.add(
        SizedBox(
          height: 20,
        ),
      );
      tagList.removeRange(0, 4);
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: rowWidgets);
  }
}
