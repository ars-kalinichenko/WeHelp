import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/custom_toast.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/standard_input_filed.dart';
import 'package:we_help/components/title_with_back_arrow.dart';
import 'package:we_help/screens/main_page.dart';
import 'package:we_help/services/rest_api.dart';

class SearchDetailScreen extends StatelessWidget {
  final String searchRequest;
  static String _changedSearchRequest;
  static String _detail;
  static String _tags;

  SearchDetailScreen(this.searchRequest);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    _changedSearchRequest = searchRequest;
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
            ),
            SizedBox(
              height: screenSize.height * 0.08,
            ),
            _mainContent(screenSize, context, appTheme, searchRequest),
          ],
        ),
      ),
    );
  }

  static void pushQuestion(
      BuildContext context, Map<String, dynamic> data) async {
    try {
      await RestApi.postQuestion(data);
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
            _changedSearchRequest = value;
          },
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Text("Расскажите подробнее"),
        StandardInputField(
          color: theme.primaryColor,
          hintText: "Что вы уже пробовали сделать?",
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
          hintText: "Введите теги через запятую",
          onChanged: (value) {
            _tags = value;
          },
        ),
        SizedBox(height: screenSize.height * 0.15),
        RoundedButton(
          text: "Далее",
          press: () {
            pushQuestion(
              context,
              {
                "title": _changedSearchRequest,
                "content": _detail,
                "author_id": "1",
                "pub_date": DateTime.now().toString(),
                "tags": _tags
              },
            );
          },
        ),
        SizedBox(height: screenSize.height * 0.07)
      ],
    );
  }
}
