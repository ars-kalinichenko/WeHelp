import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_help/components/article_preview.dart';
import 'package:we_help/components/search_field.dart';
import 'package:we_help/components/tips_with_background.dart';
import 'package:we_help/models/tag.dart';
import 'package:we_help/screens/home/question_input_screen.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    String _searchRequest;

    /// Temporary examples until backend connects.
    List<Widget> samples = [
      ArticlePreview(
        name: "Евгений",
        surname: "Моховской",
        title: "Что делать если на тебя напал дикий еж?",
        description: "В лесу встретил злого ежа. \nЧто делать?",
        tags: [Tag(id: 0, name: " #дикие животные ", color: "grey")],
        date: "24.07.2020",
        time: "23:46",
        answersCount: 11,
      ),
      ArticlePreview(
        name: "Марина",
        surname: "Тарчинская",
        title: "Как приготовить настоящий узбекский плов?",
        description: "Плов хочу как в Узбекистане. \nКак такое готовить?",
        tags: [
          Tag(id: 0, name: " #кулинария ", color: "grey"),
          Tag(id: 1, name: " #еда ", color: "grey"),
          Tag(id: 0, name: " #национальная кухня ", color: "grey"),
        ],
        date: "24.07.2020",
        time: "23:46",
        answersCount: 11,
      ),
      ArticlePreview(
        name: "Арсений",
        surname: "Калиниченко",
        title: "Как создать звезду смерти?",
        description: "На меня голуби в парке напали. Хочу отомстить!",
        tags: [
          Tag(id: 4, name: " #инженерия ", color: "grey"),
          Tag(id: 6, name: " #философия ", color: "grey")
        ],
        date: "04.08.2020",
        time: "18:22",
        answersCount: 217,
      ),
    ];

    return Scaffold(
      //Todo: fix tips list view.
      body: ListView(
          padding: EdgeInsets.only(left: screenHeight * 0.03,
          ),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.045),
                Container(
                  height: screenHeight * 0.14,
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
                ),
                SizedBox(height: screenHeight * 0.03),
                SearchInputField(
                  width: 0.87,
                  hintText: "Ваш вопрос...",
                  onChanged: (value) {
                    _searchRequest = value;
                  },
                  onPressed: () {
                    print(_searchRequest);
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                      return SearchInputScreen(_searchRequest);
                    }),
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Актуальное для тебя",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: samples,)
          ]),
    );
  }
}
