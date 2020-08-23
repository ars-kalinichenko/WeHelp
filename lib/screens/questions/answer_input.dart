import 'package:flutter/material.dart';
import 'package:we_help/components/rounded_button.dart';
import 'package:we_help/components/title_with_back_arrow.dart';
import 'package:we_help/services/rest_api.dart';

class AnswerInputScreen extends StatelessWidget {
  static String _text = '';
  final int questionId;

  AnswerInputScreen({Key key, @required this.questionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    ThemeData appTheme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: screenHeight * 0.11,
            left: screenWeight * 0.1,
            right: screenWeight * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            titleWithBackArrow(appTheme, context, "Ответить на вопрос",
                () => Navigator.of(context).pop()),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              style: TextStyle(color: Color(0xff3F3D56)),
              maxLines: null,
              onChanged: (value) {
                _text = value;
              },
            ),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            _saveButton(context),
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _saveButton(BuildContext context) {
    return RoundedButton(
      text: "Ответить",
      press: () async {
        await RestApi.postAnswer(
            {"text": _text, "question": questionId.toString()});
        Navigator.of(context).pop();
      },
    );
  }
}
