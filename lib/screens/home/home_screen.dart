import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/question_preview.dart';
import 'package:we_help/components/search_field.dart';
import 'package:we_help/components/tips_with_background.dart';
import 'package:we_help/models/tag.dart';
import 'package:we_help/screens/home/question_input_screen.dart';
import 'package:we_help/services/rest_api.dart';

class HomeScreen extends StatelessWidget {
  static String _searchRequest;
  static List<Widget> _samples = [
    QuestionPreview(
      name: "Евгений",
      surname: "Моховской",
      title: "Что делать если на тебя напал дикий еж?",
      description: "В лесу встретил злого ежа. \nЧто делать?",
      tags: [Tag(id: 0, name: " #дикие животные ", color: "grey")],
      answersCount: 11,
    ),
    QuestionPreview(
      name: "Марина",
      surname: "Тарчинская",
      title: "Как приготовить настоящий узбекский плов?",
      description: "Плов хочу как в Узбекистане. \nКак такое готовить?",
      tags: [
        Tag(id: 0, name: " #кулинария ", color: "grey"),
        Tag(id: 1, name: " #еда ", color: "grey"),
        Tag(id: 0, name: " #национальная кухня ", color: "grey"),
      ],
      answersCount: 11,
    ),
    QuestionPreview(
      name: "Арсений",
      surname: "Калиниченко",
      title: "Как создать звезду смерти?",
      description: "На меня голуби в парке напали. Хочу отомстить!",
      tags: [
        Tag(id: 4, name: " #инженерия ", color: "grey"),
        Tag(id: 6, name: " #философия ", color: "grey")
      ],
      answersCount: 217,
    ),
  ];

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    RestApi.getArticles();
    return Scaffold(
      //Todo: fix tips list view.
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
          _actualList(_samples),
        ],
      ),
    );
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
        print(_searchRequest);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return SearchInputScreen(_searchRequest);
          }),
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
