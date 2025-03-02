import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/custom_toast.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/components/title_with_back_arrow.dart';
import 'package:we_help/screens/main_page.dart';
import 'package:we_help/services/rest_api.dart';

class QuestionDetailScreen extends StatelessWidget {
  final String questionRequest;
  static String _changedQuestionRequest;
  static String _detail;
  static String _tags;

  QuestionDetailScreen(this.questionRequest);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    _changedQuestionRequest = questionRequest;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.11,
          left: screenSize.width * 0.1,
          right: screenSize.width * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            titleWithBackArrow(
              appTheme,
              context,
              "Задать вопрос",
                  () => Navigator.of(context).pop(),
            ),
            SizedBox(
              height: screenSize.height * 0.08,
            ),
            _mainContent(screenSize, context, appTheme, questionRequest),
          ],
        ),
      ),
    );
  }

  static void pushQuestion(BuildContext context, dynamic json) async {
    try {
      await RestApi.postQuestion(json);
      ToastUtils.showSuccessToast(context);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return MainPage();
      }), (Route<dynamic> route) => false);
    } catch (e) {
      ToastUtils.showErrorToast(context);
      print(e.toString());
    }
  }

  Widget _mainContent(
      Size screenSize, BuildContext context, ThemeData theme, String initText) {
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
            _changedQuestionRequest = value;
          },
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Text("Расскажите подробнее"),
        StandardInputField(
          color: theme.primaryColor,
          hintText: "Что вы уже пробовали сделать?",
          keyboardMode: TextCapitalization.sentences,
          onChanged: (value) {
            _detail = value;
          },
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Text("Введите теги"),
        StandardInputField(
          color: theme.primaryColor,
          keyboardMode: TextCapitalization.sentences,
          hintText: "Введите теги через запятую",
          onChanged: (value) {
            _tags = value;
          },
        ),
        SizedBox(height: screenSize.height * 0.15),
        RoundedButton(
          text: "Далее",
          press: () async {
            //todo: reuse
            var list = [];
            for (String tag in _tags.split(",")) {
              list.add({"name": tag, "color": "grey"});
            }

            Map<String, dynamic> data = {
              "name": _changedQuestionRequest,
              "description": _detail,
              "tags": list
            };
            print(json.encode(data));
            pushQuestion(
              context,
              json.encode(data),
            );
          },
        ),
        SizedBox(height: screenSize.height * 0.07)
      ],
    );
  }
}
