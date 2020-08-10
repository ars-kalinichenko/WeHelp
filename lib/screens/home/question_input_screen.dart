import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/components/text_button.dart';
import 'package:we_help/components/title_with_back_arrow.dart';
import 'package:we_help/screens/home/question_detail_screen.dart';

class SearchInputScreen extends StatelessWidget {
  final String searchRequest;
  static String _changedSearchRequest;

  SearchInputScreen(this.searchRequest);

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    _changedSearchRequest = searchRequest;
    ThemeData appTheme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: screenHeight * 0.11,
          left: screenWeight * 0.1,
          right: screenWeight * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            titleWithBackArrow(appTheme, context, "Задать вопрос"),
            SizedBox(height: screenHeight * 0.05),
            _questionFieldAndLike(appTheme, screenHeight, searchRequest),
            SizedBox(height: screenHeight * 0.04),
            _showAllButton(),
            SizedBox(height: screenHeight * 0.07),
            _nextButton(context),
            SizedBox(height: screenHeight * 0.07)
          ],
        ),
      ),
    );
  }

  Widget _questionFieldAndLike(ThemeData theme, double screenHeight, initText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Ваш вопрос"),
        StandardInputField(
            color: theme.primaryColor,
            initText: initText,
            hintText: "Как приручить манула?",
            onChanged: (value) {
              _changedSearchRequest = value;
            }),
        SizedBox(height: screenHeight * 0.06),
        Text("Похожий вопрос уже обсуждался ",
            style: theme.textTheme.headline4),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        Text("Как воспитать котика? - 3 ответа"),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        Text("Как уничтожить мир? - 4 ответа"),
        SizedBox(
          height: screenHeight * 0.03,
        ),
      ],
    );
  }

  Widget _showAllButton() {
    return TextButton(
      text: "Показать все",
      textStyle: TextStyle(
        fontSize: 18,
        decoration: TextDecoration.underline,
      ),
    );
  }

  Widget _nextButton(BuildContext context) {
    return RoundedButton(
      text: "Далее",
      press: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SearchDetailScreen(_changedSearchRequest);
            },
          ),
        );
      },
    );
  }
}
