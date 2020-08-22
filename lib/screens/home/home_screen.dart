import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/question_preview.dart';
import 'package:we_help/components/search_field.dart';
import 'package:we_help/components/tips_with_background.dart';
import 'package:we_help/examples.dart';
import 'package:we_help/models/public_question.dart';
import 'package:we_help/screens/questions/question_input_screen.dart';
import 'package:we_help/services/rest_api.dart';

class HomeScreen extends StatefulWidget {
  createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static String _searchRequest;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<List<PublicQuestion>>(
      future: RestApi.getActual(),
      builder:
          (BuildContext context, AsyncSnapshot<List<PublicQuestion>> snapshot) {
        List<QuestionPreview> childWidget;
        if (snapshot.hasData) {
          childWidget = questionToPreview(snapshot.data);
        } else {
          childWidget = Examples.questionSamples;
        }
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.only(
              left: screenHeight * 0.03,
            ),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.045),
                  _tipsRow(screenHeight),
                  SizedBox(height: screenHeight * 0.03),
                  _questionInputField(context),
                  SizedBox(height: screenHeight * 0.03),
                  _actualText(),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              _actualList(childWidget),
            ],
          ),
        );
      },
    );
  }

  static List<QuestionPreview> questionToPreview(
      List<PublicQuestion> questions) {
    List<QuestionPreview> previews = [];
    for (final question in questions) {
      previews.add(
        QuestionPreview(
          authorName: question.author.name,
          authorSurname: question.author.surname,
          title: question.title,
          description: question.content,
          tags: question.tags,
          answersCount: question.answers,
        ),
      );
    }
    return previews;
  }

  Widget _tipsRow(screenHeight) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: screenHeight * 0.14),
      child: ListView(
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TipsWithBackground(
            title: "Почувствуйте себя в роли эксперта",
            description: "Ответьте на вопросы",
            imagePath: "assets/images/tips_back1.png",
          ),
          TipsWithBackground(
            title: "Расскажите всем о своем опыте",
            description: "Напишите статью",
            imagePath: "assets/images/tips_back2.png",
          ),
          TipsWithBackground(
            title: "Вопросы про коронавирус",
            description: "Ответьте на вопросы",
            imagePath: "assets/images/tips_back1.png",
          ),
        ],
      ),
    );
  }

  Widget _questionInputField(BuildContext context) {
    return SearchInputField(
      width: 0.87,
      hintText: "Ваш вопрос...",
      onChanged: (value) {
        _searchRequest = value;
      },
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return QuestionInputScreen(_searchRequest);
            },
          ),
        );
      },
    );
  }

  Widget _actualText() {
    return Text(
      "Актуальное для тебя",
      style: TextStyle(fontSize: 24),
    );
  }

  Widget _actualList(List<Widget> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: data,
    );
  }
}
